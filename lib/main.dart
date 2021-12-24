import 'package:flutter/material.dart';
import 'package:sdui/sdui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:wutsi_wallet_prototype/prototype/pay/terminal_status.dart';

import 'prototype/cash/history.dart';
import 'prototype/cash/home.dart';
import 'prototype/cash/invest.dart';
import 'prototype/cash/onboard.dart';
import 'prototype/cash/qr_code.dart';
import 'prototype/cash/send.dart';
import 'prototype/cash/settings.dart';
import 'prototype/cash/settings_account.dart';
import 'prototype/cash/settings_personal.dart';
import 'prototype/cash/settings_security.dart';
import 'prototype/pay/terminal.dart';
import 'prototype/pay/terminal_qr.dart';

bool? onboarded;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Http.getInstance().interceptors = [
    HttpJsonInterceptor(),
    HttpInternationalizationInterceptor(),
    HttpTracingInterceptor("demo", await _deviceId())
  ];

  onboarded = (await SharedPreferences.getInstance())
      .getBool(HttpOnboardingInterceptor.headerOnboarded);
  runApp(const MyApp());
}

Future<String> _deviceId() async {
  final prefs = await SharedPreferences.getInstance();
  var deviceId = prefs.getString(HttpTracingInterceptor.headerDeviceId);
  if (deviceId == null || deviceId.isEmpty) {
    deviceId = const Uuid().v1();
    prefs.setString(HttpTracingInterceptor.headerDeviceId, deviceId);
  }
  return deviceId;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      // initialRoute: onboarded == true ? "/" : "/onboard",
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
      routes: _routes(),
      theme: ThemeData(
          primaryColor: const Color(0xff1D7EDF),
          dividerColor: const Color(0xff8c8c8c),

          // Define the default font family.
          // fontFamily: 'PT Sans',
          textTheme: Theme.of(context).textTheme.apply(
              bodyColor: const Color(0xff404040),
              displayColor: const Color(0xff404040))),
    );
  }

  Map<String, WidgetBuilder> _routes() => {
        '/': (context) => const HomeScreen(),
        '/error': (context) => const ErrorScreen(),
        '/onboard': (context) => const OnboardScreen(),
        '/onboard/pin': (context) => const OnboardPINScreen(),
        '/onboard/pin/confirm': (context) => const OnboardPINConfirmScreen(),
        '/onboard/profile': (context) => const OnboardProfileScreen(),
        '/onboard/verify': (context) => const OnboardVerifyScreen(),
        '/invest': (context) => const InvestScreen(),
        '/history': (context) => const HistoryScreen(),
        '/qr-code': (context) => const QRCodeScreen(),
        '/send': (context) => const SendScreen(),
        '/send/to': (context) => const SendToScreen(),
        '/send/to/phone-failed': (context) => const SendToPhoneFailedScreen(),
        '/send/for': (context) => const SendForScreen(),
        '/send/password': (context) => const SendPasswordScreen(),
        '/send/confirmation': (context) => const SendConfirmationScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/settings/account': (context) => const SettingsAccountScreen(),
        '/settings/account/cash-in': (context) => const SettingsCashInScreen(),
        '/settings/account/cash-in/confirmation': (context) =>
            const SettingsCashInConfirmationScreen(),
        '/settings/account/cash-out': (context) =>
            const SettingsCashOutScreen(),
        '/settings/account/cash-out/confirmation': (context) =>
            const SettingsCashOutConfirmationScreen(),
        '/settings/account/type': (context) =>
            const SettingsAccountTypeScreen(),
        '/settings/account/type/mobile': (context) =>
            const SettingsAccountMobileScreen(),
        '/settings/account/type/mobile/verify': (context) =>
            const SettingsAccountMobileVerifyScreen(),
        '/settings/account/details': (context) =>
            const SettingsAccountDetailsScreen(),
        '/settings/personal': (context) => const SettingsPersonalScreen(),
        '/settings/security': (context) => const SettingsSecurityScreen(),
        '/settings/security/pin': (context) => SettingsSecurityPINScreen(),

        // Terminal for Operator
        '/terminal': (context) => const TerminalScreen(),
        '/terminal/qr': (context) => const TerminalQRScreen(),
        '/terminal/status': (context) => const TerminalStatusScreen(),
      };
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('!!! ERROR !!!'),
        ),
      );
}

/// Interceptor that add tracing information into the request headers.
/// The tracing information added are:
/// - `X-Device-ID`: ID of the device
/// - `X-Trace-ID`: ID that represent the interfaction trace
/// - `X-Client-ID`: Identification of the client application
class HttpTracingInterceptor extends HttpInterceptor {
  static const String headerDeviceId = 'X-Device-ID';
  static const String headerTraceId = 'X-Trace-ID';
  static const String headerClientId = 'X-Client-ID';

  String clientId = '';
  String deviceId = '';

  HttpTracingInterceptor(this.clientId, this.deviceId);

  @override
  void onRequest(RequestTemplate request) async {
    request.headers[headerClientId] = clientId;
    request.headers[headerTraceId] = const Uuid().v1();
    request.headers[headerDeviceId] = deviceId;
  }

  @override
  void onResponse(ResponseTemplate response) {}
}

/// HTTP interceptor that stored into the share preferences the response header `x-onboarded`,
/// to indicate that the user has been onboarded.
class HttpOnboardingInterceptor extends HttpInterceptor {
  static const String headerOnboarded = 'x-onboarded';

  @override
  void onRequest(RequestTemplate request) {}

  @override
  void onResponse(ResponseTemplate response) async {
    if (response.headers[headerOnboarded] != null) {
      (await SharedPreferences.getInstance()).setBool(headerOnboarded, true);
    }
  }
}

/// HTTP interceptor that set the request header `Accept-Language` to the current user language
class HttpInternationalizationInterceptor extends HttpInterceptor {
  @override
  void onRequest(RequestTemplate request) {
    request.headers['Accept-Language'] = _language();
  }

  @override
  void onResponse(ResponseTemplate response) {}

  String _language() =>
      WidgetsBinding.instance?.window.locale.languageCode ?? 'en';
}
