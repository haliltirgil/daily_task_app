/* import 'package:flutter/material.dart';

class DropdownCategory extends StatefulWidget {
  @override
  _DropdownCategoryState createState() => _DropdownCategoryState();
}

class _DropdownCategoryState extends State<DropdownCategory> {
  String dropdownValue = 'A Projesi';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
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
        items: <String>['A Projesi', 'B Projesi']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
 */

import 'package:flutter/material.dart';
import 'package:task_app/theme.dart';

class DropdownCategory extends StatefulWidget {
  //true==Proje
  //false==Diğer
  final bool typeOfJob;
  const DropdownCategory(this.typeOfJob);

  @override
  _DropdownCategoryState createState() => _DropdownCategoryState();
}

class _DropdownCategoryState extends State<DropdownCategory> {
  String dropdownValue = 'SVT Projesi';
  @override
  Widget build(BuildContext context) {
    return widget.typeOfJob == true
        ? Container(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 15,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: const BorderRadius.all(
                const Radius.circular(12.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text("SVT Projesi"),
            ),
          )
        : Container(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 15,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: const BorderRadius.all(
                const Radius.circular(12.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text("İzin"),
            ),
          );
  }
}
