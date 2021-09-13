import 'package:flutter/material.dart';
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
                        child: BuildButton()),
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
}
