import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:wutsi_mobile/prototype/widget/numeric_keyboard.dart';

class PasswordKeyboard extends StatefulWidget {
  final Color color;

  const PasswordKeyboard({Key? key, this.color = Colors.black})
      : super(key: key);

  @override
  _PasswordKeyboardState createState() => _PasswordKeyboardState(this);
}

class _PasswordKeyboardState extends State<PasswordKeyboard> {
  PasswordKeyboard delegate;
  String text = '';
  TextEditingController controller = TextEditingController();

  _PasswordKeyboardState(this.delegate);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment.center,
            child: PinCodeTextField(
              controller: controller,
              maxLength: 6,
              pinBoxWidth: 40,
              pinBoxHeight: 40,
              pinBoxBorderWidth: 1.0,
              pinBoxRadius: 20,
              pinBoxOuterPadding: const EdgeInsets.all(4.0),
              hideCharacter: true,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.bottomCenter,
            child: NumericKeyboard(
              textColor: delegate.color,
              onKeyboardTap: _onKeyboardTap,
              rightButtonFn: () => _onBack(),
              rightButton: const Text('Delete'),
            ),
          ),
        ],
      );

  void _onKeyboardTap(String value) {
    _changeText(text + value);
  }

  void _onBack() {
    _changeText(text.substring(0, text.length - 1));
  }

  void _changeText(String value) {
    setState(() {
      text = value;
      controller.text = value;
    });
  }
}
