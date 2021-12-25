import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class PayScreen extends StatelessWidget {
  const PayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Pay'),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: Column(children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            child: const Text(
              'Scan the QR Code from the vendor Terminal',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
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
        ]),
      );
}
