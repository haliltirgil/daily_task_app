import 'package:flutter/material.dart';

import '../theme.dart';

Widget buildButton(
    BuildContext context, String text, Function function, bool colorStatus) {
  return Padding(
    padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height / 50,
        bottom: MediaQuery.of(context).size.height / 50),
    child: SizedBox(
      width: MediaQuery.of(context).size.width / 3,
      height: MediaQuery.of(context).size.height / 18,
      child: TextButton(
        onPressed: () {
          function();
          print("object");
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
    ),
  );
}



/* class BuildButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 50),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 3,
        height: MediaQuery.of(context).size.height / 18,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(AppColors.buttonColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
          child: Text(
            "Giriş Yap",
            style: TextStyle(color: AppColors.whiteColor),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddTaskScreen()),
            );
          },
        ),
      ),
    );
  }
}
 */
/* 
Padding buildButton(BuildContext context, String text, Function function) {
  return Padding(
    padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height / 50,
        bottom: MediaQuery.of(context).size.height / 50),
    child: SizedBox(
      width: MediaQuery.of(context).size.width / 3,
      height: MediaQuery.of(context).size.height / 18,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColors.buttonColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: AppColors.whiteColor),
        ),
        onPressed: () {
          function();
          print("object");
          /* Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ShowTaskScreen()),
          ); */
        },
      ),
    ),
  );
} */