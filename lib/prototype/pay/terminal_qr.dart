import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../widget/money.dart';

class TerminalQRScreen extends StatelessWidget {
  const TerminalQRScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Payment'),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: Column(children: [
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.all(20),
            child: const MoneyText(
              value: 40000,
              currency: 'CFA',
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/qr-code-300.png',
              width: 300,
              height: 300,
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: const Text(
              'Present the QR code to the customer to proceed the payment',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ),
          Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: const Text("Check Status"),
                    onPressed: () =>
                        Navigator.pushNamed(context, '/terminal/status'),
                  ))),
        ]),
      );
}
