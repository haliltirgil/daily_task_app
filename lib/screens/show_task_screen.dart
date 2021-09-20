import 'package:flutter/material.dart';
import 'package:task_app/theme.dart';
import 'package:task_app/widgets/button.dart';
import 'package:task_app/widgets/common_profile.dart';
import 'package:task_app/widgets/date_picker.dart';

class ShowTaskScreen extends StatefulWidget {
  @override
  _ShowTaskScreenState createState() => _ShowTaskScreenState();
}

class _ShowTaskScreenState extends State<ShowTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Tarih aralığı:",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              IconButton(
                color: AppColors.buttonColor,
                icon: Icon(Icons.calendar_today_rounded),
                onPressed: () {
                  _buildTimeLimiterDialog();
                  print("Time Limiter'a basıldı.");
                },
              ),
              SizedBox(width: MediaQuery.of(context).size.width / 2.0),
              IconButton(
                color: AppColors.redColor,
                icon: Icon(Icons.picture_as_pdf_outlined),
                onPressed: () {
                  print("Pdf'e basıldı.");
                },
              ),
            ],
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Card(
                color: AppColors.taskColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
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
      ),
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

  _buildTimeLimiterDialog() {
    showDialog(
      builder: (context) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
          child: Column(
            children: [
              SimpleDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                title: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          _dismissDialog();
                          print("Time Limiter'a basıldı.");
                        },
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 50),
                    _timeLimiterElement("Başlangıç Tarihi"),
                    SizedBox(height: MediaQuery.of(context).size.height / 50),
                    _timeLimiterElement("Bitiş Tarihi"),
                    buildButton(context, "Seç", _dismissDialog, false),
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

  Widget _timeLimiterElement(String buttonText) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 15,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.greyColor),
        borderRadius: const BorderRadius.all(
          const Radius.circular(12.0),
        ),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 25),
      child: DatePicker(buttonText),
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
