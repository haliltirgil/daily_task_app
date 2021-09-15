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
    return Container(
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
        child: Text(text),
      ),
    );
  }
}
