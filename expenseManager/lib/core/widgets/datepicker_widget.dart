import 'package:flutter/material.dart';

class ExpenseDatePickerWidget extends StatelessWidget {
  const ExpenseDatePickerWidget({
    super.key,
    required this.controller,
    required this.selectedDate,
    required this.onSelectedDate,
  });

  final TextEditingController controller;
  final DateTime? selectedDate;
  final Function(DateTime) onSelectedDate;

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: []);
  }


}
