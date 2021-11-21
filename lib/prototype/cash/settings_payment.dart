import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SettingsPaymentTypesScreen extends StatelessWidget {
  const SettingsPaymentTypesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Add Payment Method'),
      ),
      body: _SettingsPaymentTypeWidget());
}

class _SettingsPaymentTypeWidget extends StatelessWidget {
  final PageController controller = PageController();

  _SettingsPaymentTypeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => PageView(
          controller: controller,
          scrollDirection: Axis.vertical,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: _page1(context),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: _page2(context),
            ),
          ]);

  Widget _page1(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.all(10),
              child: const Text(
                'SELECT TYPE OF PAYMENT',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )),
          Flexible(
              child: ListView(
            children: [
              const Divider(height: 1),
              ListTile(
                contentPadding: const EdgeInsets.all(10),
                leading: Image.asset('assets/images/mobile-48.png',
                    width: 48, height: 48),
                trailing: const Icon(Icons.chevron_right),
                title: const Text('Mobile Money'),
                onTap: () => _next(),
              ),
              const Divider(height: 1),
              ListTile(
                contentPadding: const EdgeInsets.all(10),
                leading: Image.asset('assets/images/paypal-48.png',
                    width: 48, height: 48),
                trailing: const Icon(Icons.chevron_right),
                title: const Text('Paypal'),
                onTap: () => _next(),
              ),
              const Divider(height: 1),
              ListTile(
                contentPadding: const EdgeInsets.all(10),
                leading: Image.asset('assets/images/bank-48.png',
                    width: 48, height: 48),
                trailing: const Icon(Icons.chevron_right),
                title: const Text('Bank'),
                onTap: () => _next(),
              ),
              const Divider(height: 1),
              ListTile(
                contentPadding: const EdgeInsets.all(10),
                leading: Image.asset('assets/images/creditcard-48.png',
                    width: 48, height: 48),
                trailing: const Icon(Icons.chevron_right),
                title: const Text('Credit Card'),
                onTap: () => _next(),
              ),
              const Divider(height: 1),
            ],
          ))
        ],
      );

  Widget _page2(BuildContext context) => Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Image.asset('assets/images/mobile-48.png'),
          ),
          const Text(
            'MOBILE PAYMENT',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          )
        ]),
        const Divider(),
        IntlPhoneField(
          initialCountryCode: 'CM',
        ),
        DropdownButtonFormField(
            // icon: const Icon(Icons.arrow_downward),
            iconSize: 32,
            hint: const Text("Choose the mobile carrier"),
            items: [
              DropdownMenuItem<String>(
                  value: '1',
                  child: Container(
                      padding: const EdgeInsets.all(2),
                      child: Row(children: [
                        Container(
                          margin: const EdgeInsets.all(5),
                          child: Image.asset('assets/images/mtn-48.png'),
                        ),
                        const Text('MTN')
                      ]))),
              DropdownMenuItem<String>(
                  value: '2',
                  child: Container(
                      padding: const EdgeInsets.all(2),
                      child: Row(children: [
                        Container(
                          margin: const EdgeInsets.all(5),
                          child: Image.asset('assets/images/orange-48.png'),
                        ),
                        const Text('Orange')
                      ]))),
              DropdownMenuItem<String>(
                  value: '3',
                  child: Container(
                      padding: const EdgeInsets.all(2),
                      child: Row(children: [
                        Container(
                          margin: const EdgeInsets.all(5),
                          child: Image.asset('assets/images/nexttel-48.png'),
                        ),
                        const Text('Nexttel')
                      ]))),
            ],
            onChanged: (value) => {}),
        const Divider(),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            child: const Text('Save'),
            onPressed: () => _save(context),
          ),
        ),
      ]);

  void _next() => controller.animateToPage(1,
      duration: const Duration(milliseconds: 400), curve: Curves.easeIn);

  void _save(BuildContext context) {
    Navigator.pop(context);
  }
}
