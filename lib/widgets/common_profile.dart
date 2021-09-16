import 'package:flutter/material.dart';
import 'package:task_app/screens/show_task_screen.dart';

import '../theme.dart';
import 'button.dart';
import 'dropdown_button.dart';

class CommonProfile extends StatefulWidget {
  final bool checkButton;
  const CommonProfile(this.checkButton);

  @override
  _CommonProfileState createState() => _CommonProfileState();
}

class _CommonProfileState extends State<CommonProfile> {
  final List<String> typeOfJob = ['Proje', 'Diğer'];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2.34,
        decoration: BoxDecoration(
          color: AppColors.containerColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
          child: Column(
            children: [
              widget.checkButton == true
                  ? Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(Icons.login_outlined),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 25),
                    ),
              CircleAvatar(
                radius: MediaQuery.of(context).size.height / 16,
                backgroundImage: NetworkImage(
                    'https://pbs.twimg.com/media/EhvkTWmXkAEGzjt.jpg'),
                backgroundColor: Colors.transparent,
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 40),
              Text("Halil İbrahim Tirgil"),
              SizedBox(height: MediaQuery.of(context).size.height / 80),
              Text("Mühendis"),
              widget.checkButton == true
                  ? _profileWithButton()
                  : _profileWithoutButton()
            ],
          ),
        ),
      ),
    );
  }

  void _addTaskElement() {
    showDialog(
      builder: (context) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
          child: Column(
            children: [
              SimpleDialog(
                backgroundColor: AppColors.whiteColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                title: Column(
                  children: [
                    _showDialogElement("Tarih:"),
                    SizedBox(height: MediaQuery.of(context).size.height / 45),
                    _showDialogElement("Saat:"),
                    SizedBox(height: MediaQuery.of(context).size.height / 45),
                    _dropdownForJobCategory(),
                    SizedBox(height: MediaQuery.of(context).size.height / 30),
                    //-----------------------------------
                    Container(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height / 100.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.backgroundColor,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Lütfen açıklama yazınız...",
                          border: InputBorder.none,
                        ),
                        maxLength: 140,
                        maxLines: 4,
                        onChanged: (value) => () {},
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 80),
                    //------------------------------------------1
                    Row(
                      children: [
                        buildButton(context, "İptal", _dismissDialog, true),
                        SizedBox(width: MediaQuery.of(context).size.width / 50),
                        buildButton(context, "Ekle", _dismissDialog, false),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 45),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      context: context,
    );
  }

  Widget _showDialogElement(String labelText) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 15,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(
          const Radius.circular(12.0),
        ),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 25),
      child: TextFormField(
        //controller: valueController,
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: AppColors.whiteColor,
          labelText: labelText,
        ),
      ),
    );
  }

  _dismissDialog() {
    Navigator.pop(context);
  }

  /* Widget _dropdownForJobCategory() {         ---*kullanılabilir form*---
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 15,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: const BorderRadius.all(
              const Radius.circular(12.0),
            ),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 25),
          child: Dropdown(),
        ),
      ],
    );
  } */

  Widget _dropdownForJobCategory() {
    return Column(
      children: [
        Align(alignment: Alignment.centerLeft, child: Dropdown()),
      ],
    );
  }

  Widget _profileWithButton() {
    return Row(
      children: [
        SizedBox(width: MediaQuery.of(context).size.width / 70),
        IconButton(
          icon: Icon(Icons.lightbulb),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        SizedBox(width: MediaQuery.of(context).size.width / 5),
        buildButton(context, "Görev Ekle", _addTaskElement, false),
        SizedBox(width: MediaQuery.of(context).size.width / 5),
        IconButton(
          icon: Icon(Icons.analytics),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ShowTaskScreen()),
            );
          },
        ),
      ],
    );
  }

  Widget _profileWithoutButton() {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 8.5),
        ),
      ],
    );
  }
}
