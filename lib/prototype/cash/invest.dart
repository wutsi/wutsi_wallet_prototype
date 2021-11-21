import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class InvestScreen extends StatelessWidget {
  const InvestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xff358856),
          actions: [
            IconButton(
                onPressed: () => Navigator.pushNamed(context, '/settings'),
                icon: const Icon(Icons.settings))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xff358856),
          selectedIconTheme: const IconThemeData(color: Colors.white),
          unselectedIconTheme: const IconThemeData(color: Colors.white),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.qr_code), label: 'Your Code'),
            BottomNavigationBarItem(
                icon: Icon(Icons.monetization_on), label: 'Send'),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: 'History'),
          ],
          onTap: (index) {
            if (index == 0) {
              Navigator.popUntil(context, (route) => route.isFirst);
            } else {
              Navigator.pushNamed(context, '/history');
            }
          },
        ),
        backgroundColor: const Color(0xff358856),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    // const Text('Your Balance:',
                    //     style: TextStyle(color: Colors.white)),
                    // const MoneyText(
                    //     value: 100000, currency: 'CFA', color: Colors.white),
                    Container(
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          ElevatedButton(
                              child: const Text('Buy'), onPressed: () => {}),
                          ElevatedButton(
                              child: const Text('Sell'), onPressed: () => {}),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      ),
                    ),
                  ],
                )),
            Flexible(
                child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 30, right: 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    child: ListView(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: const Text(
                            'Your Investments',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        const Divider(),
                        ListTile(
                          leading: Image.asset('assets/images/bitcoin-48.png',
                              width: 48, height: 48),
                          trailing: const Text('150 K CFA',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold)),
                          title: const Text('Bitcoins'),
                          onTap: () => {},
                        ),
                        const Divider(),
                        ListTile(
                          leading: Image.asset('assets/images/ethereum-48.png',
                              width: 48, height: 48),
                          title: const Text('Ethereum'),
                          trailing: const Text('350 K CFA',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold)),
                          onTap: () => {},
                        ),
                        const Divider(),
                      ],
                    ))),
          ],
        ),
      );
}
