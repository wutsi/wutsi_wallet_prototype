import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wutsi_mobile/prototype/widget/money.dart';
import 'package:wutsi_mobile/prototype/widget/password_keyboard.dart';

///----------------------------------------------------------------
/// Send
///----------------------------------------------------------------
class SendScreen extends StatelessWidget {
  const SendScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Send'),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(children: [
          Flexible(flex: 1, child: Container()),
          Flexible(
              flex: 4,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: const MoneyInput(
                  valueTextColor: Colors.white,
                  keyboardTextColor: Colors.white,
                ),
              )),
          Flexible(
            flex: 1,
            child: Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: const Text("Send"),
                      onPressed: () => Navigator.pushNamed(context, '/send/to'),
                    ))),
          ),
        ]),
      );
}

///----------------------------------------------------------------
/// Send To
///----------------------------------------------------------------
class SendToScreen extends StatelessWidget {
  const SendToScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Send To'),
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.cancel_outlined),
              onPressed: () =>
                  Navigator.popUntil(context, (route) => route.isFirst),
            ),
          ],
          bottom: TabBar(tabs: [
            Column(children: const [Icon(Icons.person), Text('Contacts')]),
            Column(children: const [Icon(Icons.phone_android), Text('Phone')]),
            Column(children: const [Icon(Icons.qr_code), Text('QR Code')]),
          ]),
        ),
        body: TabBarView(children: [
          _contactTabView(context),
          _phoneTabView(context),
          _qrTabView(context)
        ]),
      ));

  Widget _phoneTabView(BuildContext context) => Column(
        children: [
          Flexible(flex: 1, child: Container()),
          Flexible(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.topCenter,
                child: IntlPhoneField(initialCountryCode: 'CM'),
              )),
          Flexible(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: const Text('Send 5,000 CFA'),
                      onPressed: () =>
                          Navigator.pushNamed(context, '/send/to/phone-failed'),
                    )),
              )),
        ],
      );

  Widget _qrTabView(BuildContext context) => Column(
        children: [
          Container(padding: const EdgeInsets.all(30)),
          Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Image.asset('assets/images/qr-code.png',
                  width: 300, height: 300)),
          Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Ray Sponsible',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30)),
                    Icon(Icons.verified_user, color: Colors.green, size: 30)
                  ])),
          Flexible(
            flex: 1,
            child: Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: const Text("Send 5,000 CFA"),
                      onPressed: () =>
                          Navigator.pushNamed(context, '/send/confirmation'),
                    ))),
          ),
        ],
      );

  Widget _contactTabView(BuildContext context) => FutureBuilder(
      future: _getContacts(),
      builder: (BuildContext context, AsyncSnapshot<List<Contact>> contacts) {
        if (contacts.hasData) {
          var items = contacts.data!
              .where((it) => it.phones?.isNotEmpty == true)
              .toList();
          if (items.isEmpty) {
            return const Text('No contact found');
          } else {
            return ListView.separated(
                itemCount: items.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) => ListTile(
                      leading: _avatar(items[index]),
                      trailing: const Icon(Icons.chevron_right),
                      title: _displayName(items[index]),
                      subtitle: _details(items[index]),
                      onTap: () => _select(context, items[index]),
                    ));
          }
        } else if (contacts.hasError) {
          return Container();
        } else {
          return const SizedBox(
            child: CircularProgressIndicator(),
            width: 40,
            height: 40,
          );
        }
      });

  Widget _avatar(Contact contact) => contact.avatar?.isNotEmpty == true
      ? CircleAvatar(backgroundImage: MemoryImage(contact.avatar!))
      : CircleAvatar(child: Text(contact.initials()));

  Widget _displayName(Contact contact) => Text(contact.displayName ?? 'No Name',
      style: const TextStyle(fontWeight: FontWeight.bold));

  Widget _details(Contact contact) {
    List<Widget> children = <Widget>[];
    if (contact.phones?.isNotEmpty == true) {
      children.add(Row(children: [
        Container(
          padding: const EdgeInsets.all(5),
          child: const Icon(
            Icons.phone_android,
            color: Colors.grey,
            size: 16,
          ),
        ),
        Text(contact.phones![0].value!)
      ]));
    }
    if (contact.emails?.isNotEmpty == true) {
      children.add(Row(children: [
        Container(
          padding: const EdgeInsets.all(5),
          child: const Icon(
            Icons.mail,
            color: Colors.grey,
            size: 16,
          ),
        ),
        Text(contact.emails![0].value!)
      ]));
    }

    return Column(children: children);
  }

  void _select(BuildContext context, Contact contact) =>
      Navigator.pushNamed(context, '/send/for');

  Future<List<Contact>> _getContacts() async {
    bool permission = await _getPermission();
    if (permission) {
      return await ContactsService.getContacts(withThumbnails: true);
    } else {
      return Future.value(<Contact>[]);
    }
  }

  Future<bool> _getPermission() async {
    var status = await Permission.contacts.status;
    if (status.isDenied) {
      return await Permission.contacts.request().isGranted;
    } else {
      return Future.value(true);
    }
  }
}

class SendToPhoneFailedScreen extends StatelessWidget {
  const SendToPhoneFailedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            elevation: 0,
            title: const Text('Send To'),
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColor,
            actions: [
              IconButton(
                icon: const Icon(Icons.cancel_outlined),
                onPressed: () =>
                    Navigator.popUntil(context, (route) => route.isFirst),
              ),
            ]),
        body: Column(children: [
          Container(padding: const EdgeInsets.all(50)),
          Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomCenter,
              child: const Icon(Icons.error, color: Colors.red, size: 80)),
          Container(
              alignment: Alignment.bottomCenter,
              child: const Text('You cannot send money to',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 20))),
          Container(
              alignment: Alignment.bottomCenter,
              child: const Text("+237 95 05 77 77",
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 20))),
          Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomCenter,
              child: const Text(
                  "The owner of this number doesn't have Wutsi app installed",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20))),
          Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _invite(context),
                    child: const Text('Invite him to install the App.'),
                  ))),
        ]),
      );

  void _invite(BuildContext context) async {
    await Share.share(
        'Hi, install your Wutsi Wallet from http://wutsi.app/install so that I can send you 5,000 CFA.',
        subject: 'Install your Wutsi Wallet');
    Navigator.pop(context);
  }
}

///----------------------------------------------------------------
/// Send For
///----------------------------------------------------------------
class SendForScreen extends StatelessWidget {
  const SendForScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            elevation: 0,
            title: const Text('Send'),
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColor,
            actions: [
              IconButton(
                icon: const Icon(Icons.cancel_outlined),
                onPressed: () =>
                    Navigator.popUntil(context, (route) => route.isFirst),
              ),
            ]),
        body: Form(
            child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              alignment: Alignment.center,
              child: MoneyText(
                value: 5300,
                currency: 'CFA',
                color: Theme.of(context).primaryColor,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('To:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).primaryColor)),
                    Flexible(
                        child: ListTile(
                      leading: const CircleAvatar(child: Text('RS')),
                      title: const Text('Ray Sponsible'),
                      subtitle: Row(children: const [
                        Icon(
                          Icons.phone_android,
                          color: Colors.grey,
                          size: 16,
                        ),
                        Text('+237 99 50 5678')
                      ]),
                      onTap: () => {},
                    ))
                  ]),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('For:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).primaryColor)),
                    Flexible(
                        child: Container(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        maxLength: 50,
                        decoration: const InputDecoration(
                            hintText: 'Describe your transaction'),
                      ),
                    ))
                  ]),
            ),
            Flexible(
                flex: 1,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        child: const Text('Send 5,000 CFA'),
                        onPressed: () =>
                            Navigator.pushNamed(context, '/send/password'),
                      )),
                )),
          ],
        )),
      );
}

///----------------------------------------------------------------
/// Send Password
///----------------------------------------------------------------
class SendPasswordScreen extends StatelessWidget {
  const SendPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 0,
            actions: [
              IconButton(
                icon: const Icon(Icons.cancel_outlined),
                onPressed: () =>
                    Navigator.popUntil(context, (route) => route.isFirst),
              ),
            ]),
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(children: [
          Flexible(
              flex: 1,
              child: Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.topCenter,
                  child: const Text(
                      'Enter your password to complete the transaction',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 18)))),
          Flexible(
              flex: 4,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: const PasswordKeyboard(color: Colors.white),
              )),
          Flexible(
            flex: 1,
            child: Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: const Text("Submit"),
                      onPressed: () =>
                          Navigator.pushNamed(context, '/send/confirmation'),
                    ))),
          ),
        ]),
      );
}

///----------------------------------------------------------------
/// Confirmation
///----------------------------------------------------------------
class SendConfirmationScreen extends StatelessWidget {
  const SendConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Column(children: [
          Flexible(
              child: Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.bottomCenter,
                  child: const Icon(Icons.check_circle_outline,
                      color: Colors.green, size: 80))),
          Flexible(
              child: Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.topCenter,
                  child: const Text('You send 5,000 CFA to Ray Sponsible',
                      style: TextStyle(fontSize: 18)))),
          Flexible(
              child: Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        child: const Text('Done'),
                        onPressed: () => _done(context),
                      ))))
        ]),
      );

  void _done(BuildContext context) =>
      Navigator.popUntil(context, (route) => route.isFirst);
}
