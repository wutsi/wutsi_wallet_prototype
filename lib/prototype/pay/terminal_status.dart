import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../widget/money.dart';

class TerminalStatusScreen extends StatelessWidget {
  const TerminalStatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Payment'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: Column(children: [
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.all(10),
            child: const MoneyText(
              value: 40000,
              currency: 'CFA',
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: _statusWidget(context, "success"),
          ),
        ]),
      );

  Widget _statusWidget(BuildContext context, String status) {
    if (status == 'success') {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.check_circle, size: 64, color: Color(0xff4CAF50)),
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.all(20),
            child: const Text(
              'The payment has successful',
              style: TextStyle(
                  color: Color(0xff4CAF50),
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      child: const Text("Close"),
                      onPressed: () => _done(context)))),
        ],
      );
    } else if (status == 'failure') {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.error_sharp, size: 48, color: Color(0xff8B0000)),
          Container(
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Failure - Not enough funds',
                style: TextStyle(
                    color: Color(0xff8B0000),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )),
          Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      child: const Text("Try Again"),
                      onPressed: () => _tryAgain(context)))),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            strokeWidth: 4,
          ),
          Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                'Waiting for Payment...',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
        ],
      );
    }
  }

  void _tryAgain(BuildContext context) {
    Navigator.pop(context);
    Navigator.pop(context);
  }

  void _done(BuildContext context) {
    Navigator.popUntil(context, (route) => route.isFirst);
  }
}
