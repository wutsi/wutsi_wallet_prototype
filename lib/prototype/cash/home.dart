import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatelessWidget {
  final bool business = false;

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: _backgroundColor(context),
          foregroundColor: Colors.white,
          title: const Text('Wutsi Wallet'),
          actions: [
            IconButton(
                onPressed: () => Navigator.pushNamed(context, '/settings'),
                icon: const Icon(Icons.settings))
          ],
          leading: IconButton(
              onPressed: () => Navigator.pushNamed(context, '/history'),
              icon: const Icon(Icons.history)),
        ),
        body: Column(
          children: [
            Container(
                padding: const EdgeInsets.all(10),
                color: _backgroundColor(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // TextButton(
                    //     child: Column(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         crossAxisAlignment: CrossAxisAlignment.center,
                    //         children: [
                    //           const Icon(
                    //             Icons.qr_code_scanner,
                    //             color: Colors.white,
                    //           ),
                    //           Container(
                    //               padding: const EdgeInsets.all(5.0),
                    //               child: const Text('Scan',
                    //                   style: TextStyle(color: Colors.white)))
                    //         ]),
                    //     onPressed: () => Navigator.pushNamed(context, '/pay')),
                    TextButton(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.money,
                                color: Colors.white,
                              ),
                              Container(
                                  padding: const EdgeInsets.all(5.0),
                                  child: const Text('Cashin',
                                      style: TextStyle(color: Colors.white)))
                            ]),
                        onPressed: () => Navigator.pushNamed(
                            context, '/settings/account/cash-in')),
                    TextButton(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.monetization_on_sharp,
                                color: Colors.white,
                              ),
                              Container(
                                  padding: const EdgeInsets.all(5.0),
                                  child: const Text('Send',
                                      style: TextStyle(color: Colors.white)))
                            ]),
                        onPressed: () => Navigator.pushNamed(context, '/send')),
                    TextButton(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.qr_code,
                                color: Colors.white,
                              ),
                              Container(
                                  padding: const EdgeInsets.all(5.0),
                                  child: const Text('QR Code',
                                      style: TextStyle(color: Colors.white)))
                            ]),
                        onPressed: () =>
                            Navigator.pushNamed(context, '/qr-code')),
                  ],
                )),
            Flexible(
                child:
                    GridView.count(crossAxisCount: 3, children: _apps(context)))
          ],
        ),
      );

  Color _backgroundColor(BuildContext context) =>
      Theme.of(context).primaryColor;

  //business ? const Color(0xff358856) : Theme.of(context).primaryColor;

  List<Widget> _apps(BuildContext context) {
    List<Widget> widgets = [];
    if (business) {
      widgets.addAll([
        TextButton(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.payment,
                    color: Theme.of(context).primaryColor,
                  ),
                  Container(
                      padding: const EdgeInsets.all(5.0),
                      child: const Text('Payment',
                          style: TextStyle(color: Colors.black)))
                ]),
            onPressed: () =>
                Navigator.pushNamed(context, '/terminal/authorize')),
        TextButton(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_bag_outlined,
                    color: Theme.of(context).primaryColor,
                  ),
                  Container(
                      padding: const EdgeInsets.all(5.0),
                      child: const Text('E-Commerce',
                          style: TextStyle(color: Colors.black)))
                ]),
            onPressed: () => {}),
      ]);
    }

    widgets.addAll([
      TextButton(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.car_rental,
                  color: Theme.of(context).primaryColor,
                ),
                Container(
                    padding: const EdgeInsets.all(5.0),
                    child: const Text('Taxi',
                        style: TextStyle(color: Colors.black)))
              ]),
          onPressed: () => {}),
      TextButton(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.directions_bus_rounded,
                  color: Theme.of(context).primaryColor,
                ),
                Container(
                    padding: const EdgeInsets.all(5.0),
                    child: const Text('Bus',
                        style: TextStyle(color: Colors.black)))
              ]),
          onPressed: () => {}),
      TextButton(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.restaurant,
                  color: Theme.of(context).primaryColor,
                ),
                Container(
                    padding: const EdgeInsets.all(5.0),
                    child: const Text('Restaurants',
                        style: TextStyle(color: Colors.black)))
              ]),
          onPressed: () => {}),
      TextButton(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.local_mall_sharp,
                  color: Theme.of(context).primaryColor,
                ),
                Container(
                    padding: const EdgeInsets.all(5.0),
                    child: const Text('Shop',
                        style: TextStyle(color: Colors.black)))
              ]),
          onPressed: () => {}),
      TextButton(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.local_movies_sharp,
                  color: Theme.of(context).primaryColor,
                ),
                Container(
                    padding: const EdgeInsets.all(5.0),
                    child: const Text('Cinema',
                        style: TextStyle(color: Colors.black)))
              ]),
          onPressed: () => {}),
    ]);
    return widgets;
  }
}
