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
