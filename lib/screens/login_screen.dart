import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:task_app/screens/add_task_screen.dart';
import 'package:task_app/theme.dart';
import 'package:task_app/widgets/button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      //backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildLoginPhoto(),
            _buildLoginForm(),
            SizedBox(height: MediaQuery.of(context).size.height / 20),
            Text(
              "© Tüm hakları saklıdır.",
              style: TextStyle(color: AppColors.whiteColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginPhoto() {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 10),
      child: Align(
        child: CircleAvatar(
          radius: MediaQuery.of(context).size.height / 6,
          backgroundImage: AssetImage('assets/img/loginphoto.png'),
        ),
        alignment: Alignment.center,
      ),
    );
  }

  Widget _buildLoginForm() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width / 40,
        MediaQuery.of(context).size.height / 20,
        0,
        0,
      ),
      child: Container(
        height: (MediaQuery.of(context).size.height / 2.4),
        width: MediaQuery.of(context).size.width / 1.3,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 8,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 22),
          child: Column(
            children: [
              _buildFormElement("Ad Soyad"),
              _buildFormElement("Şifre"),
              buildButton(context, "Giriş Yap", routePage, false),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormElement(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 13.2,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 15),
          child: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: text,
            ),
          ),
        ),
      ),
    );
  }

  void routePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddTaskScreen(),
      ),
    );
  }
}
