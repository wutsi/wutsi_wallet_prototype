import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'numeric_keyboard.dart';

class MoneyText extends StatelessWidget {
  final double value;
  final String currency;
  final String numberFormat;
  final double valueFontSize;
  final double currencyFontSize;
  final Color color;
  final bool bold;

  const MoneyText(
      {Key? key,
      required this.value,
      required this.currency,
      this.numberFormat = '#,###,##0',
      this.valueFontSize = 50,
      this.currencyFontSize = 18,
      this.color = Colors.black,
      this.bold = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Text.rich(TextSpan(
          text: NumberFormat(numberFormat).format(value),
          style: TextStyle(
              color: color,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              fontSize: valueFontSize),
          children: [
            WidgetSpan(
              child: Transform.translate(
                offset: Offset(5.0, currencyFontSize - valueFontSize),
                child: Text(
                  currency,
                  style: TextStyle(
                      color: color,
                      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
                      fontSize: currencyFontSize),
                ),
              ),
            ),
          ]));
}

class MoneyInput extends StatefulWidget {
  final Color keyboardTextColor;
  final Color valueTextColor;

  const MoneyInput(
      {Key? key,
      this.keyboardTextColor = Colors.black,
      this.valueTextColor = Colors.black})
      : super(key: key);

  @override
  _MoneyInputState createState() => _MoneyInputState(this);
}

class _MoneyInputState extends State<MoneyInput> {
  int state = 0;
  final MoneyInput delegate;
  final NumberFormat formatter = NumberFormat('#,###,##0');

  _MoneyInputState(this.delegate);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(30),
            child: MoneyText(
              value: state.toDouble(),
              color: delegate.valueTextColor,
              currency: 'CFA',
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: NumericKeyboard(
              textColor: delegate.keyboardTextColor,
              onKeyboardTap: _onKeyboardTap,
              rightButtonFn: () => _onBack(),
              rightButton: const Icon(Icons.chevron_left),
            ),
          ),
        ],
      );

  void _onKeyboardTap(String value) {
    _changeText(state * 10 + int.parse(value));
  }

  void _onBack() {
    int value = (state ~/ 10).toInt();
    _changeText(value);
  }

  void _changeText(int value) {
    if (value.toString().length <= 10) {
      setState(() {
        state = value;
      });
    }
  }
}
