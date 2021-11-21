import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class QRCodeScreen extends StatelessWidget {
  const QRCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor:
            Theme.of(context).textTheme.bodyText1?.color ?? Colors.black,
        actions: [
          IconButton(
              onPressed: () => _share(), icon: const Icon(Icons.ios_share))
        ],
      ),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.topCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(64),
                  child: Image.asset('assets/images/profile.jpeg',
                      width: 64, height: 64),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.topCenter,
                child: const Text('Herve Tchepannou',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                alignment: Alignment.center,
                color: Colors.white,
                child: Image.asset(
                  'assets/images/qr-code-300.png',
                  width: 300,
                  height: 300,
                ),
              ),
            ],
          )));

  void _share() async {
    String path = await _file('assets/images/qr-code-share.png');
    Share.shareFiles([path],
        text:
            'Please add me as your Wutsi contact. http://wutsi.app/qr/3203920392');
  }

  Future<String> _file(String asset) async {
    final ByteData bytes = await rootBundle.load(asset);
    final Uint8List list = bytes.buffer.asUint8List();

    final tempDir = await getTemporaryDirectory();
    final file = await File('${tempDir.path}/image.jpg').create();
    file.writeAsBytesSync(list);
    return file.path;
  }
}
