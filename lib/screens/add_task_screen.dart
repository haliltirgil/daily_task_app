import 'package:flutter/material.dart';
import 'package:task_app/screens/login_screen.dart';
import 'package:task_app/screens/show_task_screen.dart';
import 'package:task_app/theme.dart';
import 'package:task_app/widgets/button.dart';
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
}
