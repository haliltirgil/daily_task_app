import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:task_app/models/event_model.dart';

import '../theme.dart';
import 'button.dart';
import 'dropdown_button.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  Map<DateTime, List<ProjectEvent>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<ProjectEvent> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 70),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.greyColor,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          children: [
            _buildButton("Görev Ekle", _addTaskElement),
            TableCalendar(
              focusedDay: selectedDay,
              firstDay: DateTime(1990),
              lastDay: DateTime(2050),
              calendarFormat: format,
              onFormatChanged: (CalendarFormat _format) {
                setState(() {
                  format = _format;
                });
              },
              startingDayOfWeek: StartingDayOfWeek.monday,
              daysOfWeekVisible: true,

              //Day Changed
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                setState(() {
                  selectedDay = selectDay;
                  focusedDay = focusDay;
                });
                print(focusedDay);
              },
              selectedDayPredicate: (DateTime date) {
                return isSameDay(selectedDay, date);
              },

              eventLoader: _getEventsfromDay,

              //To style the Calendar
              calendarStyle: CalendarStyle(
                isTodayHighlighted: true,
                selectedDecoration: BoxDecoration(
                  color: AppColors.taskColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                selectedTextStyle: TextStyle(color: AppColors.whiteColor),
                todayDecoration: BoxDecoration(
                  color: AppColors.buttonColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                defaultDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                weekendDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                weekendTextStyle: TextStyle(color: AppColors.redColor),
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: true,
                titleCentered: true,
                formatButtonShowsNext: false,
                formatButtonDecoration: BoxDecoration(
                  color: AppColors.buttonColor,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                formatButtonTextStyle: TextStyle(
                  color: AppColors.whiteColor,
                ),
              ),
            ),
            ..._getEventsfromDay(selectedDay).map(
              (ProjectEvent event) => ListTile(
                title: Text(
                  event.title,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, Function function) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height / 150,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 4,
        height: MediaQuery.of(context).size.height / 20,
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
            backgroundColor:
                MaterialStateProperty.all<Color>(AppColors.buttonColor),
          ),
        ),
      ),
    );
  }

  void _addTaskElement() {
    showDialog(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 10),
          child: AlertDialog(
            content: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 50),
                _showDialogElement("Saat:"),
                SizedBox(height: MediaQuery.of(context).size.height / 45),
                _dropdownForJobCategory(),
                SizedBox(height: MediaQuery.of(context).size.height / 30),
                //-----------------------------------
                // Acıklama ekle containerı
                Container(
                  padding: EdgeInsets.all(
                      MediaQuery.of(context).size.height / 100.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.greyColor,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Lütfen açıklama yazınız...",
                      border: InputBorder.none,
                    ),
                    maxLength: 140,
                    maxLines: 4,
                    onChanged: (value) => () {},
                    controller: _eventController,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 80),

                //------------------------------------------1
                Row(
                  children: [
                    buildButton(context, "İptal", _dismissDialog, true),
                    SizedBox(width: MediaQuery.of(context).size.width / 50),
                    buildButton(context, "Ekle", _addProject, false),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _addProject() {
    if (_eventController.text.isEmpty) {
    } else {
      if (selectedEvents[selectedDay] != null) {
        selectedEvents[selectedDay].add(
          ProjectEvent(title: _eventController.text),
        );
      } else {
        selectedEvents[selectedDay] = [
          ProjectEvent(title: _eventController.text)
        ];
      }
    }
    Navigator.pop(context);
    _eventController.clear();
    setState(() {});
    return;
  }

  Widget _showDialogElement(String labelText) {
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
      child: TextFormField(
        //controller: valueController,
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: AppColors.whiteColor,
          labelText: labelText,
        ),
      ),
    );
  }

  _dismissDialog() {
    Navigator.pop(context);
  }

  Widget _dropdownForJobCategory() {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Dropdown(),
        ),
      ],
    );
  }
}
