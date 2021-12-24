import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../widget/money.dart';

class SettingsAccountScreen extends StatelessWidget {
  const SettingsAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          foregroundColor:
              Theme.of(context).textTheme.bodyText1?.color ?? Colors.black,
        ),
        body: Column(
          children: [
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: Column(children: [
                  const Text('Your Balance:'),
                  const MoneyText(value: 40000, currency: 'CFA'),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            child: const Text('Add Cash'),
                            onPressed: () => Navigator.pushNamed(
                                context, '/settings/account/cash-in'),
                          ),
                          TextButton(
                            child: const Text('Cash Out'),
                            onPressed: () => Navigator.pushNamed(
                                context, '/settings/account/cash-out'),
                          ),
                        ]),
                  ),
                ])),
            const Divider(),
            Flexible(
                child: Container(
                    alignment: Alignment.topLeft,
                    child: ListView(
                      children: [
                        ListTile(
                          contentPadding: const EdgeInsets.all(10),
                          leading: Image.asset('assets/images/orange-48.png',
                              width: 48, height: 48),
                          trailing: const Icon(Icons.chevron_right),
                          title: const Text('Mobile 5555'),
                          onTap: () => _details(context),
                        ),
                        const Divider(),
                        // ListTile(
                        //   contentPadding: const EdgeInsets.all(10),
                        //   leading: Image.asset('assets/images/mtn-48.png',
                        //       width: 48, height: 48),
                        //   trailing: const Icon(Icons.chevron_right),
                        //   title: const Text('Mobile 6666'),
                        //   onTap: () => _details(context),
                        // ),
                        // const Divider(),
                        // ListTile(
                        //   contentPadding: const EdgeInsets.all(10),
                        //   leading: Image.asset('assets/images/paypal-48.png',
                        //       width: 48, height: 48),
                        //   trailing: const Icon(Icons.chevron_right),
                        //   title: const Text('Paypal h...@gmail.com'),
                        //   onTap: () => _details(context),
                        // ),
                        // const Divider(),
                      ],
                    ))),
            Container(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  child: const Text('Link Account'),
                  onPressed: () =>
                      Navigator.pushNamed(context, '/settings/account/type'),
                ))
          ],
        ),
      );

  void _details(BuildContext context) =>
      Navigator.pushNamed(context, '/settings/account/details');
}

///==========================================================
/// CASH IN
///==========================================================
class SettingsCashInScreen extends StatelessWidget {
  final bool singleAccount = true;

  const SettingsCashInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: true,
          title: const Text('Add Cash'),
          foregroundColor:
              Theme.of(context).textTheme.bodyText1?.color ?? Colors.black,
        ),
        body: Form(
          child: Column(children: [
            Flexible(flex: 1, child: Container()),
            Flexible(
                flex: 4,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: MoneyInput(
                      valueTextColor: Theme.of(context).primaryColor),
                )),
            Flexible(
                flex: 1,
                child: Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          child: const Text('Add'),
                          onPressed: () => _cashin(context),
                        ))))
          ]),
        ),
      );

  void _cashin(BuildContext context) =>
      Navigator.pushNamed(context, '/settings/account/cash-in/confirmation');
}

class SettingsCashInConfirmationScreen extends StatelessWidget {
  const SettingsCashInConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: true,
          automaticallyImplyLeading: false,
          foregroundColor:
              Theme.of(context).textTheme.bodyText1?.color ?? Colors.black,
        ),
        body: Column(children: [
          Flexible(
              child: Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.bottomCenter,
                  child: const Icon(Icons.check_circle_outline,
                      color: Colors.green, size: 80))),
          Flexible(
              child: Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.topCenter,
                  child: const Text('You added 45,000 CFA to your Wutsi Wallet',
                      style: TextStyle(fontSize: 18)))),
          Flexible(
              child: Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        child: const Text('Done'),
                        onPressed: () => _done(context),
                      ))))
        ]),
      );

  void _done(BuildContext context) {
    Navigator.pop(context);
    Navigator.pop(context);
  }
}

///==========================================================
/// CASH OUT
///==========================================================
class SettingsCashOutScreen extends StatelessWidget {
  const SettingsCashOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Cash Out'),
          centerTitle: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          foregroundColor:
              Theme.of(context).textTheme.bodyText1?.color ?? Colors.black,
        ),
        body: Column(
          children: [
            Flexible(flex: 1, child: Container()),
            Flexible(
              flex: 4,
              child: Container(
                  padding: const EdgeInsets.all(10),
                  child: const _AmountStatefulWidget()),
            ),
            Flexible(
                flex: 2,
                child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.bottomCenter,
                    child: Row(children: [
                      Text('To:',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      Flexible(
                          child: DropdownButtonFormField(
                              icon: const Icon(Icons.arrow_downward),
                              hint: const Text("Cash out to..."),
                              value: '1',
                              items: [
                                DropdownMenuItem<String>(
                                    value: '1',
                                    child: Row(children: [
                                      Image.asset('assets/images/orange-48.png',
                                          width: 32, height: 32),
                                      const Text('  Mobile 6666')
                                    ])),
                              ],
                              onChanged: (value) => {}))
                    ]))),
            Flexible(
                flex: 1,
                child: Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          child: const Text('Cash Out'),
                          onPressed: () => Navigator.pushNamed(context,
                              '/settings/account/cash-out/confirmation'),
                        ))))
          ],
        ),
      );
}

class SettingsCashOutConfirmationScreen extends StatelessWidget {
  const SettingsCashOutConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: true,
          automaticallyImplyLeading: false,
          foregroundColor:
              Theme.of(context).textTheme.bodyText1?.color ?? Colors.black,
        ),
        body: Column(children: [
          Flexible(
              child: Container(
                  alignment: Alignment.bottomCenter,
                  child: const Icon(Icons.check_circle_outline,
                      color: Colors.green, size: 80))),
          Flexible(
              child: Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.topCenter,
                  child: const Text('You have cashed out 30,000 CFA',
                      style: TextStyle(fontSize: 18)))),
          Flexible(
              child: Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        child: const Text('Done'),
                        onPressed: () => _done(context),
                      ))))
        ]),
      );

  void _done(BuildContext context) =>
      Navigator.popUntil(context, (route) => route.isFirst);
}

class _AmountStatefulWidget extends StatefulWidget {
  const _AmountStatefulWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AmountState();
}

class _AmountState extends State<_AmountStatefulWidget> {
  double state = 0;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            child: MoneyText(
              value: state,
              currency: 'CFA',
              color: Theme.of(context).primaryColor,
            ),
          ),
          Slider(
              value: state,
              min: 0,
              max: 40000,
              onChanged: (value) => _changed(value))
        ],
      );

  void _changed(double value) {
    setState(() => {state = value});
  }
}

///==========================================================
/// Link Account
///==========================================================
class SettingsAccountTypeScreen extends StatelessWidget {
  const SettingsAccountTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor:
            Theme.of(context).textTheme.bodyText1?.color ?? Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(children: [
            Container(
                padding: const EdgeInsets.all(10),
                child: const Icon(Icons.monetization_on,
                    color: Colors.green, size: 48)),
            const Flexible(
                child: Text(
              'Link an account',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            )),
          ]),
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Linking Wusti App with yours  account will allow you to:',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Row(
            children: [
              Container(
                  padding: const EdgeInsets.all(10),
                  child: const Icon(Icons.check, color: Colors.green)),
              const Flexible(
                child: Text(
                  'Send money to friends',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                  padding: const EdgeInsets.all(10),
                  child: const Icon(Icons.check, color: Colors.green)),
              const Flexible(
                child: Text(
                  'Transfer money between your accounts',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                  padding: const EdgeInsets.all(10),
                  child: const Icon(Icons.check, color: Colors.green)),
              const Flexible(
                child: Text(
                  'Make online payments',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  maxLines: 3,
                ),
              ),
            ],
          ),
          const Divider(),
          Flexible(
              child: ListView(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.all(10),
                leading: Image.asset('assets/images/mobile-48.png',
                    width: 48, height: 48),
                trailing: const Icon(Icons.chevron_right),
                title: const Text('Mobile Money'),
                onTap: () => _next(context),
              ),
              const Divider(height: 1),
              ListTile(
                contentPadding: const EdgeInsets.all(10),
                leading: Image.asset('assets/images/bank-48.png',
                    width: 48, height: 48),
                trailing: const Icon(Icons.chevron_right),
                title: const Text('Bank'),
                onTap: () => _next(context),
              ),
              const Divider(height: 1),
              ListTile(
                contentPadding: const EdgeInsets.all(10),
                leading: Image.asset('assets/images/creditcard-48.png',
                    width: 48, height: 48),
                trailing: const Icon(Icons.chevron_right),
                title: const Text('Credit Card'),
                onTap: () => _next(context),
              ),
              const Divider(height: 1),
              ListTile(
                contentPadding: const EdgeInsets.all(10),
                leading: Image.asset('assets/images/paypal-48.png',
                    width: 48, height: 48),
                trailing: const Icon(Icons.chevron_right),
                title: const Text('Paypal'),
                onTap: () => _next(context),
              ),
              const Divider(height: 1),
            ],
          ))
        ],
      ));

  void _next(BuildContext context) =>
      Navigator.pushNamed(context, '/settings/account/type/mobile');
}

///==========================================================
/// PAYMENT MOBILE
///==========================================================
class SettingsAccountMobileScreen extends StatelessWidget {
  const SettingsAccountMobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor:
            Theme.of(context).textTheme.bodyText1?.color ?? Colors.black,
      ),
      body: Column(children: [
        Row(children: [
          Container(
              padding: const EdgeInsets.all(10),
              child: Image.asset('assets/images/mobile-48.png')),
          const Flexible(
              child: Text(
            'Link mobile account',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )),
        ]),
        Container(
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Wutsi Wallet will send you a SMS to confirm you are the owner of the account',
            style: TextStyle(fontSize: 16),
          ),
        ),
        const Divider(),
        Container(
          padding: const EdgeInsets.all(10),
          child: IntlPhoneField(
            initialCountryCode: 'CM',
            countries: const ['CM'],
            // autofocus: true,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Row(children: [
            Image.asset('assets/images/orange-48.png'),
            Image.asset('assets/images/mtn-48.png'),
            Image.asset('assets/images/nexttel-48.png'),
          ]),
        ),
        Flexible(
          child: Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text('Link Account'),
                  onPressed: () => _link(context),
                ),
              )),
        ),
      ]));

  void _link(BuildContext context) {
    Navigator.pushNamed(context, '/settings/account/type/mobile/verify');
  }
}

class SettingsAccountMobileVerifyScreen extends StatelessWidget {
  const SettingsAccountMobileVerifyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor:
            Theme.of(context).textTheme.bodyText1?.color ?? Colors.black,
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            Row(children: [
              Container(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset('assets/images/mobile-48.png')),
              const Flexible(
                  child: Text(
                'Verify account',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),
            ]),
            Container(
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Wutsi Wallet sent you a verification code via SMS to ensure that your are the owner of the mobile account.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: TextButton(
                child: const Text('Resent Code'),
                onPressed: () => {},
              ),
            ),
            const Divider(),
            Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: TextFormField(
                maxLength: 6,
                // autofocus: true,
                decoration: const InputDecoration(
                    label: Text('CODE'), hintText: 'Enter 6 digits code'),
              ),
            ),
            Flexible(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        child: const Text('Verify'),
                        onPressed: () => _verify(context),
                      ),
                    ))),
          ])));

  void _verify(BuildContext context) {
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.pop(context);
  }
}

///==========================================================
/// PAYMENT DETAILS
///==========================================================
class SettingsAccountDetailsScreen extends StatelessWidget {
  const SettingsAccountDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text('Mobile Account')),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            Container(
                padding: const EdgeInsets.all(10),
                child: Image.asset('assets/images/orange-128.png')),
            Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: const Text('Mobile 5678',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
            const Divider(),
            Flexible(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(10),
                    child: const Text('Linked: 28-Sept-2020',
                        textAlign: TextAlign.left)),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(10),
                    child: const Text('Last Transaction: 28-Sept-2020',
                        textAlign: TextAlign.left))
              ]),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.red),
                child: const Text('Unlink'),
                onPressed: () => _delete(context),
              ),
            ),
          ])));

  void _delete(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child:
                      const Icon(Icons.warning, size: 48, color: Colors.red)),
              const Text(
                "Unlink the account?",
              )
            ]),
            actions: [
              TextButton(
                child: const Text('Yes'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ),
              TextButton(onPressed: () => {}, child: const Text('No'))
            ],
          );
        });
  }
}
