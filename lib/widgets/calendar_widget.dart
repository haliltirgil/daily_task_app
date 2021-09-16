/* import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime selectedDate = DateTime.now(); // TO tracking date

  int currentDateSelectedIndex = 0; //For Horizontal Date
  ScrollController scrollController =
      ScrollController(); //To Track Scroll of ListView

  List<String> listOfMonths = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  List<String> listOfDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Text('Takvim'),
      ),
      body: Column(
        children: [
          //To Show Current Date
          Container(
              height: 30,
              margin: EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                selectedDate.day.toString() +
                    '-' +
                    listOfMonths[selectedDate.month - 1] +
                    ', ' +
                    selectedDate.year.toString(),
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.indigo[700]),
              )),
          SizedBox(height: 10),
          //To show Calendar Widget
          Container(
              height: 80,
              child: Container(
                  child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 10);
                },
                itemCount: 365,
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        currentDateSelectedIndex = index;
                        selectedDate =
                            DateTime.now().add(Duration(days: index));
                      });
                    },
                    child: Container(
                      height: 80,
                      width: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[400],
                                offset: Offset(3, 3),
                                blurRadius: 5)
                          ],
                          color: currentDateSelectedIndex == index
                              ? Colors.black
                              : Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            listOfMonths[DateTime.now()
                                        .add(Duration(days: index))
                                        .month -
                                    1]
                                .toString(),
                            style: TextStyle(
                                fontSize: 16,
                                color: currentDateSelectedIndex == index
                                    ? Colors.white
                                    : Colors.grey),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            DateTime.now()
                                .add(Duration(days: index))
                                .day
                                .toString(),
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: currentDateSelectedIndex == index
                                    ? Colors.white
                                    : Colors.grey),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            listOfDays[DateTime.now()
                                        .add(Duration(days: index))
                                        .weekday -
                                    1]
                                .toString(),
                            style: TextStyle(
                                fontSize: 16,
                                color: currentDateSelectedIndex == index
                                    ? Colors.white
                                    : Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ))),
        ],
      ),
    ));
  }
}
 */

/*import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:task_app/theme.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 50),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: AppColors.containerColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TableCalendar(
                //onDayLongPressed: ,
                initialCalendarFormat: CalendarFormat.month,
                calendarStyle: CalendarStyle(
                  todayColor: AppColors.buttonColor,
                  selectedColor: AppColors.buttonColor,
                  todayStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                      color: AppColors.redColor),
                ),
                headerStyle: HeaderStyle(
                  centerHeaderTitle: true,
                  formatButtonDecoration: BoxDecoration(
                    color: AppColors.buttonColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  formatButtonTextStyle: TextStyle(color: AppColors.whiteColor),
                  formatButtonShowsNext: false,
                ),
                startingDayOfWeek: StartingDayOfWeek.monday,
                builders: CalendarBuilders(
                  selectedDayBuilder: (context, date, events) => Container(
                      margin: const EdgeInsets.all(5.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColors.taskColor,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(color: AppColors.whiteColor),
                      )),
                  todayDayBuilder: (context, date, events) => Container(
                      margin: const EdgeInsets.all(5.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(color: AppColors.whiteColor),
                      )),
                ),
                calendarController: _controller,
              )
            ],
          ),
        ),
      ),
    );
  }
}
 */

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:task_app/models/event_model.dart';

import '../theme.dart';
import 'button.dart';
import 'date_picker.dart';
import 'dropdown_button.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
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
            _buildButton("Görev Ekle", _addTaskElement1),
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
                  color: Colors.blue,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                selectedTextStyle: TextStyle(color: Colors.white),
                todayDecoration: BoxDecoration(
                  color: Colors.purpleAccent,
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
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: true,
                titleCentered: true,
                formatButtonShowsNext: false,
                formatButtonDecoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                formatButtonTextStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ..._getEventsfromDay(selectedDay).map(
              (Event event) => ListTile(
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

  void _addTaskElement1() {
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
                _showDialogElement('', true),
                SizedBox(height: MediaQuery.of(context).size.height / 45),
                _showDialogElement("Saat:", false),
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
          Event(title: _eventController.text),
        );
      } else {
        selectedEvents[selectedDay] = [Event(title: _eventController.text)];
      }
    }
    Navigator.pop(context);
    _eventController.clear();
    setState(() {});
    return;
  }

  void _addTaskElement() {
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
                    _showDialogElement('', true),
                    SizedBox(height: MediaQuery.of(context).size.height / 45),
                    _showDialogElement("Saat:", false),
                    SizedBox(height: MediaQuery.of(context).size.height / 45),
                    _dropdownForJobCategory(),
                    SizedBox(height: MediaQuery.of(context).size.height / 30),
                    //-----------------------------------
                    Container(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height / 100.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.greyColor,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Lütfen açıklama yazınız...",
                          border: InputBorder.none,
                        ),
                        maxLength: 140,
                        maxLines: 4,
                        onChanged: (value) => () {},
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 80),
                    //------------------------------------------1
                    Row(
                      children: [
                        buildButton(context, "İptal", _dismissDialog, true),
                        SizedBox(width: MediaQuery.of(context).size.width / 50),
                        buildButton(context, "Ekle", _dismissDialog, false),
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

  Widget _showDialogElement(String labelText, bool elementType) {
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
      child: elementType == true
          ? DatePicker()
          : TextFormField(
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
        Align(alignment: Alignment.centerLeft, child: Dropdown()),
      ],
    );
  }
}
