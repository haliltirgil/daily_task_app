import 'package:flutter/material.dart';
import 'package:task_app/theme.dart';
import 'package:task_app/widgets/common_profile.dart';

class ShowTaskScreen extends StatefulWidget {
  @override
  _ShowTaskScreenState createState() => _ShowTaskScreenState();
}

class _ShowTaskScreenState extends State<ShowTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          ProfileLabel(false),
          Flexible(
            flex: 5,
            child: Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 45),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.containerColor,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: _buildTaskList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /* Widget _buildTaskList(String text) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 13.2,
            decoration: BoxDecoration(
              color: AppColors.taskColor,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Align(
              child: Text(
                text,
                style: TextStyle(color: AppColors.whiteColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
 */
  Widget _buildTaskList() {
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
                    _addElement();
                    print(index);
                  },
                  onLongPress: () {},
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 15,
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
            })
      ],
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
                    _dialogButton("Çıkış"),
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
