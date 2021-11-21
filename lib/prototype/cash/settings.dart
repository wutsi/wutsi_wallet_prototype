import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            foregroundColor:
                Theme.of(context).textTheme.bodyText1?.color ?? Colors.black),
        body: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(64),
                    child: Image.asset('assets/images/profile.jpeg',
                        width: 128, height: 128),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    margin: const EdgeInsets.all(10),
                    child: const Text(
                      'Herve Tchepannou',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    child: const Text(
                      '+237 99 50 5555',
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
            Flexible(
                child: ListView(
              children: [
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.verified_user, color: Colors.blue),
                  trailing: const Icon(Icons.chevron_right),
                  title: const Text('Personal'),
                  subtitle: const Text('Edit your personal information'),
                  onTap: () =>
                      {Navigator.pushNamed(context, '/settings/personal')},
                ),
                const Divider(),
                ListTile(
                  leading:
                      const Icon(Icons.monetization_on, color: Colors.green),
                  trailing: const Icon(Icons.chevron_right),
                  title: const Text('Accounts'),
                  subtitle: const Text('Manage your accounts for payments'),
                  onTap: () =>
                      {Navigator.pushNamed(context, '/settings/account')},
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.lock, color: Colors.red),
                  trailing: const Icon(Icons.chevron_right),
                  title: const Text('Security'),
                  subtitle: const Text('Protect your account'),
                  onTap: () =>
                      {Navigator.pushNamed(context, '/settings/security')},
                ),
                const Divider(),
                // ListTile(
                //   leading: const Icon(Icons.contact_page, color: Colors.blue),
                //   trailing: const Icon(Icons.chevron_right),
                //   title: const Text('Invite a Friend'),
                //   subtitle: const Text('Invite a friend to join Wutsi'),
                //   onTap: () => {},
                // ),
                // const Divider(),
              ],
            ))
          ],
        ),
      );
}
