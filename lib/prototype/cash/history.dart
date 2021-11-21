import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Transaction History'),
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          foregroundColor:
              Theme.of(context).textTheme.bodyText1?.color ?? Colors.black,
        ),
        body: ListView(
          children: [
            const Divider(),
            ListTile(
              leading: Image.asset(
                'assets/images/mtn-48.png',
                width: 48,
                height: 48,
              ),
              trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text('31,000 CFA',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                      '1h ago',
                      textAlign: TextAlign.right,
                    ),
                  ]),
              title: const Text('Cash Out',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('MTN'),
            ),
            const Divider(),
            ListTile(
              leading: const CircleAvatar(child: Text('T')),
              trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text('350 CFA',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                      'Yesterday',
                      textAlign: TextAlign.right,
                    ),
                  ]),
              title: const Text('To: Taxi',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const Divider(),
            ListTile(
              leading: const CircleAvatar(child: Text('UE')),
              trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text('7,500 CFA',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                      'Yesterday',
                      textAlign: TextAlign.right,
                    ),
                  ]),
              title: const Text('To: United Express',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('Yaounde - Douala'),
            ),
            const Divider(),
            ListTile(
              leading: const CircleAvatar(child: Text('RM')),
              trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text('500 CFA',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                      '2d ago',
                      textAlign: TextAlign.right,
                    ),
                  ]),
              title: const Text('To: Taxi Espoir',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('Taxi'),
            ),
            const Divider(),
            ListTile(
              leading: const CircleAvatar(child: Text('RM')),
              trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text('15,000 CFA',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                      '27-Oct',
                      textAlign: TextAlign.right,
                    ),
                  ]),
              title: const Text('From: Roger Milla',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('Merci!'),
            ),
            const Divider(),
            ListTile(
              leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profile.jpeg')),
              trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text('5,000 CFA',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                      '20-Oct',
                      textAlign: TextAlign.right,
                    ),
                  ]),
              title: const Text('To: Ray',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('Restaurant'),
            ),
            const Divider(),
            ListTile(
              leading: Image.asset(
                'assets/images/orange-48.png',
                width: 48,
                height: 48,
              ),
              trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text('45,000 CFA',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                      '15-Sept',
                      textAlign: TextAlign.right,
                    ),
                  ]),
              title: const Text('Add Cash',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('Orange'),
            ),
            const Divider(),
          ],
        ),
      );
}
