import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../widget/password_keyboard.dart';

///----------------------------------------------------------------
/// Onboard Screen
///----------------------------------------------------------------
class OnboardScreen extends StatelessWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
          body: SafeArea(
        child: Column(
          children: [
            Container(padding: const EdgeInsets.all(30)),
            Container(
                padding: const EdgeInsets.all(10),
                child: Image.asset('assets/images/logo-192.png'),
                width: 128,
                height: 128),
            Container(
                padding: const EdgeInsets.all(10),
                child: const Text('What is your phone number?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.black))),
            Container(
                padding: const EdgeInsets.all(10),
                child:
                    const Text('You will receive via SMS a verification code')),
            Container(
                padding: const EdgeInsets.all(40),
                alignment: Alignment.center,
                child: IntlPhoneField(initialCountryCode: 'CM')),
            Flexible(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            child: const Text('Continue'),
                            onPressed: () => Navigator.pushNamed(
                                context, '/onboard/verify')))))
          ],
        ),
      ));
}

///----------------------------------------------------------------
/// Verify
///----------------------------------------------------------------
class OnboardVerifyScreen extends StatelessWidget {
  const OnboardVerifyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
          body: SafeArea(
        child: Column(
          children: [
            Container(padding: const EdgeInsets.all(30)),
            Container(
                padding: const EdgeInsets.all(10),
                child: Image.asset('assets/images/logo-192.png'),
                width: 128,
                height: 128),
            Container(
                padding: const EdgeInsets.all(10),
                child: const Text('Enter verification code',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.black))),
            Container(
                padding: const EdgeInsets.all(10),
                child: const Text(
                    'Enter the code sent via SMS to +237 95 07 77 77')),
            Container(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                        child: const Text('Resend code'),
                        onPressed: () => {}))),
            Container(
                padding: const EdgeInsets.all(40),
                alignment: Alignment.center,
                child: TextFormField(
                  maxLength: 6,
                )),
            Flexible(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.bottomCenter,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                    child: const Text('Continue'),
                                    onPressed: () => Navigator.pushNamed(
                                        context, '/onboard/profile'))),
                          ),
                          Container(
                              padding: const EdgeInsets.all(10),
                              child: SizedBox(
                                  width: double.infinity,
                                  child: TextButton(
                                      child: const Text('Change Number'),
                                      onPressed: () => Navigator.pop(context))))
                        ])))
          ],
        ),
      ));
}

///----------------------------------------------------------------
/// Profile
///----------------------------------------------------------------
class OnboardProfileScreen extends StatelessWidget {
  const OnboardProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
          body: SafeArea(
              child: Column(children: [
        Container(padding: const EdgeInsets.all(30)),
        Container(
            padding: const EdgeInsets.all(10),
            child: Image.asset('assets/images/logo-192.png'),
            width: 128,
            height: 128),
        Container(
            padding: const EdgeInsets.all(10),
            child: const Text('Create your profile',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black))),
        Container(
            padding: const EdgeInsets.all(10),
            child: const Text('Enter your first and last name')),
        Container(
            padding: const EdgeInsets.all(40),
            alignment: Alignment.center,
            child: TextFormField(
              maxLength: 50,
            )),
        Flexible(
            child: Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        child: const Text('Continue'),
                        onPressed: () =>
                            Navigator.pushNamed(context, '/onboard/pin'))))),
      ])));
}

///----------------------------------------------------------------
/// PIN
///----------------------------------------------------------------
class OnboardPINScreen extends StatelessWidget {
  const OnboardPINScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
          body: SafeArea(
        child: Column(children: [
          Container(padding: const EdgeInsets.all(30)),
          Container(
              padding: const EdgeInsets.all(10),
              child: const Text('Enter your PIN',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.black))),
          Container(
              padding: const EdgeInsets.all(10),
              child: const Text('Secure your account with a 6 digit PIN')),
          Container(padding: const EdgeInsets.all(30)),
          Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: const PasswordKeyboard()),
          Flexible(
              child: Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          child: const Text('Continue'),
                          onPressed: () => Navigator.pushNamed(
                              context, '/onboard/pin/confirm')))))
        ]),
      ));
}

class OnboardPINConfirmScreen extends StatelessWidget {
  const OnboardPINConfirmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
          body: SafeArea(
        child: Column(children: [
          Container(padding: const EdgeInsets.all(30)),
          Container(
              padding: const EdgeInsets.all(10),
              child: const Text('Confirm your PIN',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.black))),
          Container(
              padding: const EdgeInsets.all(10),
              child: const Text('Secure your account with a 6 digit PIN')),
          Container(padding: const EdgeInsets.all(30)),
          Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: const PasswordKeyboard()),
          Flexible(
              child: Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.bottomCenter,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                child: const Text('Continue'),
                                onPressed: () =>
                                    Navigator.pushNamed(context, '/'))),
                        SizedBox(
                            width: double.infinity,
                            child: TextButton(
                                child: const Text('Change PIN'),
                                onPressed: () => Navigator.pop(context)))
                      ])))
        ]),
      ));
}
