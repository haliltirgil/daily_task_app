import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:task_app/models/project_event_model.dart';
import 'package:intl/intl.dart';

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
        child: SingleChildScrollView(
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
                  markerDecoration: BoxDecoration(
                    color: AppColors.redColor,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  isTodayHighlighted: true,
                  selectedDecoration: BoxDecoration(
                    color: AppColors.taskColor,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  selectedTextStyle: TextStyle(color: AppColors.whiteColor),
                  todayDecoration: BoxDecoration(
                    color: AppColors.blueColor,
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
                (ProjectEvent event) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.greyColor),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(12.0),
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                    child: ListTile(
                      onTap: () {
                        _addTaskElement();
                      },
                      title: Text("Proje:" +
                          " TargeT " +
                          DateFormat("dd.MM.yyyy").format(selectedDay)),
                      trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: AppColors.redColor,
                          ),
                          onPressed: () {
                            print("Takvimdeki görev silinmek isteniyor");
                            _editTaskDialogBox();
                          }),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _editTaskDialogBox() {
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

  Widget _taskElementsText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Rubik',
        fontSize: 14,
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
                    controller:
                        _eventController, //takvimdeki listede görünen metnin controlleri
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
        //selectedEvents[selectedDay].remove(value) silmek için kullanılabilir.
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
