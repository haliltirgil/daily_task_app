import 'package:flutter/material.dart';
import 'package:task_app/screens/login_screen.dart';
import 'package:task_app/screens/show_task_screen.dart';
import 'package:task_app/theme.dart';
import 'package:task_app/widgets/button.dart';

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
          Flexible(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.containerColor,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: NetworkImage(
                          'https://pbs.twimg.com/media/ERUjP0YXkAEzhn9.jpg'),
                      backgroundColor: Colors.transparent,
                    ),
                    SizedBox(height: 20),
                    Text("Halil İbrahim Tirgil"),
                    SizedBox(height: 6),
                    Text("Mühendis"),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: buildButton(context, "Görev Ekle", _addElement),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
            onTap: () {},
            onLongPress: () {},
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              child: Container(
                child: Align(child: Text("Proje")),
              ),
            ),
          ),
        );
      },
    );
  }

  _dismissDialog() {
    Navigator.pop(context);
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
                    showDialogContainer("Tarih:"),
                    SizedBox(height: MediaQuery.of(context).size.height / 45),
                    showDialogContainer("Kategori:"),
                    SizedBox(height: MediaQuery.of(context).size.height / 45),
                    showDialogContainer("Başlık:"),
                    SizedBox(height: MediaQuery.of(context).size.height / 45),
                    showDialogContainer("Açıklama:"),
                    SizedBox(height: MediaQuery.of(context).size.height / 30),
                    Row(
                      children: [
                        _dialogButton("İptal", true),
                        SizedBox(
                          width: 20,
                        ),
                        _dialogButton("Ekle", false),
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

  Widget showDialogContainer(String labelText) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 100),
      child: TextFormField(
        //controller: valueController,
        decoration: InputDecoration(
          fillColor: AppColors.whiteColor,
          labelText: labelText,
        ),
      ),
    );
  }

  Widget _dialogButton(String text, bool colorStatus) {
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
          backgroundColor: colorStatus == true
              ? MaterialStateProperty.all<Color>(AppColors.redColor)
              : MaterialStateProperty.all<Color>(AppColors.buttonColor),
        ),
      ),
    );
  }
}
