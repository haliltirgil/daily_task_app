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
