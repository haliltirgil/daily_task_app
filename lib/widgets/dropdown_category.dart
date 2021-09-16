import 'package:flutter/material.dart';

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
  String dropdownValue1 = 'İzin';
  @override
  Widget build(BuildContext context) {
    return widget.typeOfJob == true
        ? _buildJobDetailDropdown(dropdownValue)
        : _buildJobDetailDropdown(dropdownValue1);
  }

  Widget _buildJobDetailDropdown(String text) {
    String value = text;

    var items = [
      'SVT Projesi',
      'Banana',
      'Grapes',
      'Orange',
      'İzin',
      'Pineapple'
    ];

    var items1 = [
      'İzin',
      'Ver',
      'Calısmak',
      'Sıktı',
      'Admin',
      'Kardes',
    ];

    return Container(
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 15,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(
          const Radius.circular(12.0),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: value,
          icon: Icon(Icons.keyboard_arrow_down),
          items: value == 'SVT Projesi'
              ? items.map((String items) {
                  return DropdownMenuItem(
                      value: items,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 40),
                        child: Text(items),
                      ));
                }).toList()
              : items1.map((String items) {
                  return DropdownMenuItem(
                      value: items,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 40),
                        child: Text(items),
                      ));
                }).toList(),
          onChanged: (String newValue) {
            setState(() {
              value = newValue;
            });
          },
        ),
      ),
    );
  }
}
