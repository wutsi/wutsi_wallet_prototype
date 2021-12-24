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
          backgroundColor: Theme.of(context).primaryColor,
          actions: [
            IconButton(
                onPressed: () => Navigator.pushNamed(context, '/settings'),
                icon: const Icon(Icons.settings))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          selectedIconTheme: const IconThemeData(color: Colors.white),
          unselectedIconTheme: const IconThemeData(color: Colors.white),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.qr_code), label: 'Your Code'),
            BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart_outlined), label: 'Invest'),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: 'History'),
          ],
          onTap: (index) {
            if (index == 0) {
              Navigator.pushNamed(context, '/qr-code');
            } else if (index == 1) {
              Navigator.pushNamed(context, '/invest');
            } else {
              Navigator.pushNamed(context, '/history');
            }
          },
        ),
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Text('Your Balance:',
                        style: TextStyle(color: Colors.white)),
                    MoneyText(
                        value: balance, currency: 'CFA', color: Colors.white),
                    _balanceActions(context)
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
                    child: _accountList(context))),
          ],
        ),
      );

  Widget _balanceActions(BuildContext context) {
    if (balance > 0) {
      return Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: ElevatedButton(
            child: const Text('Send'),
            onPressed: () => Navigator.pushNamed(context, '/send')),
      );
    } else {
      return hasAccounts
          ? Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.center,
              child: ElevatedButton(
                  child: const Text('Add Cash'),
                  onPressed: () => Navigator.pushNamed(
                      context, '/settings/account/cash-in')),
            )
          : Container(
              padding: const EdgeInsets.all(20),
            );
    }
  }

  Widget _accountList(BuildContext context) {
    if (hasAccounts) {
      return ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: const Text(
              'Your Accounts',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          const Divider(),
          ListTile(
            leading: Image.asset('assets/images/orange-48.png',
                width: 48, height: 48),
            title: const Text('Mobile 5555'),
            onTap: () => {},
          ),
          const Divider(),
          // ListTile(
          //   leading:
          //       Image.asset('assets/images/mtn-48.png', width: 48, height: 48),
          //   title: const Text('Mobile 6666'),
          //   onTap: () => {},
          // ),
          // const Divider(),
        ],
      );
    } else {
      return Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: const Text(
              'Your Accounts',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          const Divider(),
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              'No account linked to your Wallet',
            ),
          ),
          ElevatedButton(
              child: const Text('Link Account'),
              onPressed: () =>
                  Navigator.pushNamed(context, '/settings/account/type'))
        ],
      );
    }
  }
}
