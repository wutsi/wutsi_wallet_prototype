import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../widget/money.dart';

class HomeScreen extends StatelessWidget {
  final double balance = 10000;
  final bool hasAccounts = true;

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: const Text('Wutsi Wallet'),
          actions: [
            IconButton(
                onPressed: () => Navigator.pushNamed(context, '/settings'),
                icon: const Icon(Icons.settings))
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Your Balance:'),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: MoneyText(value: balance, currency: 'CFA'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Icon(Icons.qr_code),
                                  Container(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: const Text('Pay'))
                                ]),
                            onPressed: () =>
                                Navigator.pushNamed(context, '/pay')),
                        ElevatedButton(
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Icon(Icons.monetization_on_sharp),
                                  Container(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: const Text('Send'))
                                ]),
                            onPressed: () =>
                                Navigator.pushNamed(context, '/send')),
                      ],
                    )
                  ],
                )),
          ],
        ),
      );
}
