import 'package:flutter/services.dart';

class KeralaVehicleNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text.replaceAll(RegExp(r'[^A-Za-z0-9]'), '');
    final regExp = RegExp(r'^[A-Za-z]{0,2}\d{0,2}[A-Za-z]{0,3}\d{0,4}$');
    if (!regExp.hasMatch(newText)) {
      return oldValue;
    }
    return TextEditingValue(
      text: newText.toUpperCase(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}