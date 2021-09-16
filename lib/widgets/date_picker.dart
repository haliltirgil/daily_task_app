import 'package:flutter/material.dart';
import 'package:task_app/theme.dart';

class DatePicker extends StatefulWidget {
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime currentDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
  }

  @override
  Widget build(BuildContext context) {
    //asyn await yapısı print yani tarihin ne olduğu bilgisini seçildikten sonra almak için kullanıldı
    return TextButton(
      onPressed: () async {
        await _selectDate(context);
        print(currentDate.toString());
      },
      child: Text('Tarih Seçmek İçin Tıklayın'),
    );
  }
}
