import 'package:flutter/material.dart';

import '../theme.dart';
import 'button.dart';

class ProfileLabel extends StatefulWidget {
  final bool checkButton;
  const ProfileLabel(this.checkButton);

  @override
  _ProfileLabelState createState() => _ProfileLabelState();
}

class _ProfileLabelState extends State<ProfileLabel> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Flexible(
        flex: 3,
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: AppColors.containerColor,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 12),
            child: Column(
              children: [
                CircleAvatar(
                  radius: MediaQuery.of(context).size.height / 16,
                  backgroundImage: NetworkImage(
                      'https://pbs.twimg.com/media/EhvkTWmXkAEGzjt.jpg'),
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 40),
                Text("Halil İbrahim Tirgil"),
                SizedBox(height: MediaQuery.of(context).size.height / 80),
                Text("Mühendis"),
                widget.checkButton == true
                    ? Align(
                        alignment: Alignment.bottomCenter,
                        child: buildButton(context, "Görev Ekle", _addElement),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
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
                          width: MediaQuery.of(context).size.width / 25,
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

  _dismissDialog() {
    Navigator.pop(context);
  }
}
