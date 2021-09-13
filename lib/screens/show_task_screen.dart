import 'package:flutter/material.dart';
import 'package:task_app/theme.dart';
import 'package:task_app/widgets/button.dart';

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
                        child: BuildButton()),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.containerColor,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  children: [
                    _buildTaskList(),
                    _buildTaskList(),
                    _buildTaskList(),
                    _buildTaskList(),
                    _buildTaskList(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskList() {
    return Padding(
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
            "10 Eylül 2021 ",
            style: TextStyle(color: AppColors.whiteColor),
          ),
        ),
      ),
    );
  }
}
