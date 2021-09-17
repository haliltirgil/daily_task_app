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
                        builder: (context, ThemeProvider themeNotifier, child) {
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

  Widget _profileWithButton() {
    return Row(
      children: [
        SizedBox(width: MediaQuery.of(context).size.width / 2.35),
        Text("Mühendis"),
        SizedBox(width: MediaQuery.of(context).size.width / 3.65),
        IconButton(
          icon: Icon(Icons.show_chart),
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
        SizedBox(width: MediaQuery.of(context).size.width / 75),
        IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        SizedBox(width: MediaQuery.of(context).size.width / 3.2),
        Text("Mühendis"),
      ],
    );
  }
}
