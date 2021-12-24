import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../widget/money.dart';

class TerminalScreen extends StatelessWidget {
  final double balance = 10000;

  const TerminalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Cashier'),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(children: [
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.all(20),
            child: const MoneyInput(
              valueTextColor: Colors.white,
              keyboardTextColor: Colors.white,
            ),
          ),
          Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: const Text("Submit"),
                    onPressed: () =>
                        Navigator.pushNamed(context, '/terminal/qr'),
                  ))),
        ]),
      );
}
