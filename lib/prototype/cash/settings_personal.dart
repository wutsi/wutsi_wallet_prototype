import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPersonalScreen extends StatelessWidget {
  const SettingsPersonalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          foregroundColor:
              Theme.of(context).textTheme.bodyText1?.color ?? Colors.black,
        ),
        body: Column(children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(64),
                child: Image.asset('assets/images/profile.jpeg',
                    width: 128, height: 128),
              ),
              Container(
                alignment: Alignment.topCenter,
                child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                        child: const Text('Change Picture'),
                        onPressed: () => {})),
              )
            ],
          ),
          const Divider(),
          Form(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    maxLength: 100,
                    decoration: const InputDecoration(
                        hintText: 'Herve Tchepannou', label: Text('YOUR NAME')),
                    controller: TextEditingController(text: 'Ray Sponsible'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        maxLength: 100,
                        decoration: const InputDecoration(
                            hintText: 'Your email', label: Text('EMAIL')),
                        controller: TextEditingController(
                            text: 'ray.sponsible@gmail.com'),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: DropdownButtonFormField(
                    hint: const Text('Select your language'),
                    value: 'en',
                    items: const [
                      DropdownMenuItem(value: 'en', child: Text('English')),
                      DropdownMenuItem(value: 'fr', child: Text('Francais'))
                    ],
                    onChanged: (value) => {},
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: DropdownButtonFormField(
                    hint: const Text('Select your country'),
                    value: 'CM',
                    items: const [
                      DropdownMenuItem(value: 'CM', child: Text('Cameroon')),
                      DropdownMenuItem(value: 'GB', child: Text('Gabon')),
                      DropdownMenuItem(value: 'SN', child: Text('Senegal')),
                    ],
                    onChanged: (value) => {},
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: const Text('Save'),
                      onPressed: () => _save(context),
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
      );

  void _save(BuildContext context) => Navigator.pop(context);
}
