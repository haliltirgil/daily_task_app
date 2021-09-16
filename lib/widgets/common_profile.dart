import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/helper/theme_provider.dart';
import 'package:task_app/screens/show_task_screen.dart';

import '../theme.dart';
import 'button.dart';
import 'date_picker.dart';
import 'dropdown_button.dart';

class CommonProfile extends StatefulWidget {
  final bool checkButton;
  const CommonProfile(this.checkButton);

  @override
  _CommonProfileState createState() => _CommonProfileState();
}

class _CommonProfileState extends State<CommonProfile> {
  /*  final List<String> typeOfJob = ['Proje', 'Diğer']; */
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2.7,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.greyColor,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height / 200),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 10,
                      height: MediaQuery.of(context).size.height / 22,
                      child: Consumer(
                        builder: (context, ThemeModel themeNotifier, child) {
                          return Container(
                            child: IconButton(
                              onPressed: () {
                                themeNotifier.isDark
                                    ? themeNotifier.isDark = false
                                    : themeNotifier.isDark = true;
                              },
                              icon: Icon(themeNotifier.isDark
                                  ? Icons.nightlight_round
                                  : Icons.wb_sunny),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width / 1.32),
                    widget.checkButton == true
                        ? Container(
                            width: MediaQuery.of(context).size.width / 10,
                            height: MediaQuery.of(context).size.height / 22,
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
                  ],
                ),
              ),
              CircleAvatar(
                radius: MediaQuery.of(context).size.height / 16,
                backgroundImage: NetworkImage(
                    'https://pbs.twimg.com/media/EhvkTWmXkAEGzjt.jpg'),
                backgroundColor: Colors.transparent,
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 40),
              Text("Halil İbrahim Tirgil"),
              widget.checkButton == true
                  ? _profileWithButton()
                  : _profileWithoutButton()
            ],
          ),
        ),
      ),
    );
  }

  /*SwitchListTile(
                    title: Text("Dark Mode"),
                    onChanged: (val) {
                      notifier.toggleChangeTheme();
                      print("bana basıldı ben tema butonuyum ");
                    },
                    value: notifier.darkMode,
                  ), */

  /* void _addTaskElement() {
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
                    _showDialogElement('', true),
                    SizedBox(height: MediaQuery.of(context).size.height / 45),
                    _showDialogElement("Saat:", false),
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
  } */

  /* Widget _showDialogElement(String labelText, bool elementType) {
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
      child: elementType == true
          ? DatePicker()
          : TextFormField(
              //controller: valueController,
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: AppColors.whiteColor,
                labelText: labelText,
              ),
            ),
    );
  }
 */
  /* _dismissDialog() {
    Navigator.pop(context);
  } */

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

/*   Widget _dropdownForJobCategory() {
    return Column(
      children: [
        Align(alignment: Alignment.centerLeft, child: Dropdown()),
      ],
    );
  }
 */
  Widget _profileWithButton() {
    return Row(
      children: [
        SizedBox(width: MediaQuery.of(context).size.width / 2.4),
        Text("Mühendis"),
        SizedBox(width: MediaQuery.of(context).size.width / 3.4),
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
        SizedBox(
          width: MediaQuery.of(context).size.width / 3.2,
        ),
        Text("Mühendis"),
      ],
    );
  }
}
