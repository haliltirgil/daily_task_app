import 'package:flutter/material.dart';
import 'package:task_app/theme.dart';
import 'package:task_app/widgets/button.dart';
import 'package:task_app/widgets/common_profile.dart';

class ShowTaskScreen extends StatefulWidget {
  @override
  _ShowTaskScreenState createState() => _ShowTaskScreenState();
}

class _ShowTaskScreenState extends State<ShowTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          CommonProfile(false),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 45),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.67,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.greyColor,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: _buildTaskList("20 Eylül 2021", 5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskList(String text, int hourOfWorking) {
    return Column(
      children: <Widget>[
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Card(
              color: AppColors.taskColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: InkWell(
                onTap: () {
                  _showTaskDetailForm();
                  print(index);
                },
                onLongPress: () {},
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 15,
                  child: Container(
                    child: ListTile(
                      title: Text(
                        text,
                        style: TextStyle(color: AppColors.whiteColor),
                      ),
                      trailing: Text(
                        hourOfWorking.toString() + " Saat",
                        style: TextStyle(
                            color: AppColors.whiteColor, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        SizedBox(height: MediaQuery.of(context).size.height / 35),
        Text(
          "| 1 | 2 | 3 | 4 | 5 |",
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }

  void _showTaskDetailForm() {
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
                    _taskElementsText("Halil İbrahim Tirgil"),
                    SizedBox(height: MediaQuery.of(context).size.height / 45),
                    _taskElementsText("17.09.2021"),
                    SizedBox(height: MediaQuery.of(context).size.height / 45),
                    _taskElementsText("15.00 - 16.00"),
                    SizedBox(height: MediaQuery.of(context).size.height / 45),
                    _taskElementsText("A Projesi || Diğer"),
                    SizedBox(height: MediaQuery.of(context).size.height / 30),
                    _taskElementsText("Proje ara yüz tasarımı yapıldı."),
                    SizedBox(height: MediaQuery.of(context).size.height / 30),
                    buildButton(context, "Geri", _dismissDialog, true),
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

  Widget _taskElementsText(String text) {
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
