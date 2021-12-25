import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:wutsi_wallet_prototype/prototype/widget/money.dart';

class PayInfoScreen extends StatelessWidget {
  const PayInfoScreen({Key? key}) : super(key: key);

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
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.all(20),
            child: const MoneyText(
              value: 40000,
              currency: 'CFA',
            ),
          ),
          const Text('To', style: TextStyle(fontSize: 18)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/vendor.png',
                  width: 32,
                  height: 32,
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
            ],
          ),
          Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: const Text("Pay"),
                    onPressed: () =>
                        Navigator.pushNamed(context, '/pay/authorize'),
                  ))),
        ]),
      );
}
