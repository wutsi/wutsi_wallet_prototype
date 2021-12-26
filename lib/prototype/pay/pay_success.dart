import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:wutsi_wallet_prototype/prototype/widget/money.dart';

class PaySuccessScreen extends StatelessWidget {
  const PaySuccessScreen({Key? key}) : super(key: key);

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
          Container(padding: const EdgeInsets.all(20)),
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/vendor.png',
              width: 64,
              height: 64,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: const Text(
              'Maison H',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.all(20),
            child: const MoneyText(
              value: 40000,
              currency: 'CFA',
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: const Icon(Icons.check_circle,
                size: 64, color: Color(0xff4CAF50)),
          ),
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
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: const Text("Close"),
                    onPressed: () => _done(context),
                  ))),
        ]),
      );

  void _done(BuildContext context) {
    Navigator.popUntil(context, (route) => route.isFirst);
  }
}
