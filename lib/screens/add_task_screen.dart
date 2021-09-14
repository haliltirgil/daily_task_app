import 'package:flutter/material.dart';
import 'package:task_app/theme.dart';
import 'package:task_app/widgets/common_profile.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          ProfileLabel(true),
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: _buildTaskElement(),
              ),
            ),
          ),
          Flexible(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: AppColors.taskColor,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Image.asset('assets/img/calendar.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskElement() {
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          color: AppColors.buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: InkWell(
            onTap: () {
              _addElement();
              print("object");
            },
            onLongPress: () {},
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              child: Container(
                child: Align(
                  child: Text(
                    "Proje",
                    style: TextStyle(
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _addElement() {
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
                    SizedBox(height: MediaQuery.of(context).size.height / 45),
                    showTaskDetail("Halil İbrahim Tirgil"),
                    SizedBox(height: MediaQuery.of(context).size.height / 45),
                    showTaskDetail("17.09.2021"),
                    SizedBox(height: MediaQuery.of(context).size.height / 45),
                    showTaskDetail("15.00 - 16.00"),
                    SizedBox(height: MediaQuery.of(context).size.height / 45),
                    showTaskDetail("A Projesi || Diğer"),
                    SizedBox(height: MediaQuery.of(context).size.height / 30),
                    showTaskDetail("Proje ara yüz tasarımı yapıldı."),
                    SizedBox(height: MediaQuery.of(context).size.height / 30),
                    _dialogButton("Sil"),
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

  Widget showTaskDetail(String text) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Rubik',
        fontSize: 14,
      ),
    );
  }

  Widget _dialogButton(String text) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 4,
      height: MediaQuery.of(context).size.height / 20,
      child: TextButton(
        onPressed: () {
          _dismissDialog();
        },
        child: Text(
          text,
          style: TextStyle(color: AppColors.whiteColor),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(AppColors.redColor),
        ),
      ),
    );
  }

  _dismissDialog() {
    Navigator.pop(context);
  }
}
