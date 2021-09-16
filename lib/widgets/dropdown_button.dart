import 'package:flutter/material.dart';
import 'package:task_app/widgets/dropdown_category.dart';

import '../theme.dart';

class Dropdown extends StatefulWidget {
  @override
  _DropdownState createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String dropdownValue = 'Proje';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 6,
          height: MediaQuery.of(context).size.height / 15,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.greyColor),
            borderRadius: const BorderRadius.all(
              const Radius.circular(12.0),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: dropdownValue,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                  print(dropdownValue);
                });
              },
              items: <String>['Proje', 'Diğer']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 60),
                    child: Text(value),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width / 55),
        dropdownValue == 'Proje'
            ? DropdownCategory(true)
            : DropdownCategory(false)
      ],
    );
  }
}
