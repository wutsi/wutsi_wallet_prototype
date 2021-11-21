import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wutsi_mobile/prototype/widget/password_keyboard.dart';

class SettingsSecurityScreen extends StatelessWidget {
  const SettingsSecurityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            foregroundColor:
                Theme.of(context).textTheme.bodyText1?.color ?? Colors.black),
        body: Column(
          children: [
            Flexible(
                child: ListView(
              children: [
                SwitchListTile(
                  value: true,
                  title: const Text('Security Lock'),
                  subtitle: const Text('Require PIN to transfer funds'),
                  onChanged: (value) => _lock(context),
                ),
                const Divider(height: 1),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      child: const Text('Change PIN'),
                      onPressed: () => {
                        Navigator.pushNamed(context, '/settings/security/pin')
                      },
                    )),
              ],
            )),
          ],
        ),
      );

  void _lock(BuildContext context) {
    Navigator.pushNamed(context, '/settings/security/pin');
  }
}

///------------------------------------------------------------
/// PIN
///------------------------------------------------------------
class SettingsSecurityPINScreen extends StatelessWidget {
  final PageController controller = PageController(initialPage: 0);

  SettingsSecurityPINScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            foregroundColor:
                Theme.of(context).textTheme.bodyText1?.color ?? Colors.black),
        body: PageView(
          controller: controller,
          children: [
            Column(
              children: [
                Row(children: [
                  Container(
                      padding: const EdgeInsets.all(30),
                      child:
                          const Icon(Icons.lock, color: Colors.red, size: 48)),
                  const Flexible(
                      child: Text(
                    'Choose your PIN',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  )),
                ]),
                Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Choose your PIN to secure your accounts. PIN will be requested for transfering funds.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    )),
                const Divider(),
                const Flexible(
                  child: PasswordKeyboard(),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: const Text('Submit PIN'),
                      onPressed: () => _submit(context),
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Row(children: [
                  Container(
                      padding: const EdgeInsets.all(30),
                      child:
                          const Icon(Icons.lock, color: Colors.red, size: 48)),
                  const Flexible(
                      child: Text(
                    'Confirm your PIN',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  )),
                ]),
                Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Enter the PIN again to confirm',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    )),
                const Divider(),
                const Flexible(
                  child: PasswordKeyboard(),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: const Text('Confirm PIN'),
                      onPressed: () => _confirm(context),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      );

  void _submit(BuildContext context) => controller.jumpToPage(1);

  void _confirm(BuildContext context) => Navigator.pop(context);
}
