import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:wutsi_wallet_prototype/prototype/widget/password_keyboard.dart';

class PayAuthorizeScreen extends StatelessWidget {
  const PayAuthorizeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Authorization'),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: Column(children: [
          Container(
              padding: const EdgeInsets.all(20),
              child: const Text('Enter your NIP to authorize the transaction')),
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.all(20),
            child: const PasswordKeyboard(),
          ),
          Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: const Text("Submit"),
                    onPressed: () =>
                        Navigator.pushNamed(context, '/pay/success'),
                  ))),
        ]),
      );
}
