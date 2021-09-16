import 'package:flutter/material.dart';
import 'package:task_app/theme.dart';
import 'package:task_app/widgets/button.dart';
import 'package:task_app/widgets/calendar_widget.dart';
import 'package:task_app/widgets/common_profile.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          CommonProfile(true),
          /*  Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 99),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 60,
              /*  child: _showTasks(), */
            ),
          ), */
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.6,
                  child: Calendar(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /*  Widget _showTasks() {
    return 1 == 0 // gösterirken değişkenle oynamak yeterli.
        ? Center(
            child: Container(
            width: MediaQuery.of(context).size.width / 1.05,
            height: MediaQuery.of(context).size.height / 12,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: const BorderRadius.all(
                const Radius.circular(12.0),
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 9,
              vertical: MediaQuery.of(context).size.height / 40,
            ),
            child: Text(
              "Herhangi bir göreviniz bulunmamaktadır.",
              style: TextStyle(color: AppColors.whiteColor, fontSize: 16),
            ),
          ))
        : ListView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Card(
                color: AppColors.buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: InkWell(
                  onTap: () {
                    _updateElement();
                    print("object");
                  },
                  onLongPress: () {},
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Proje",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
  } */

  void _updateElement() {
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
                    buildButton(context, "Sil", _dismissDialog, true),
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

  _dismissDialog() {
    Navigator.pop(context);
  }
}
