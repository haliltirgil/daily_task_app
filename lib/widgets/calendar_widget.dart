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

import 'package:flutter/material.dart';
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
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 35),
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
                initialCalendarFormat: CalendarFormat.month,
                calendarStyle: CalendarStyle(
                    todayColor: AppColors.buttonColor,
                    selectedColor: AppColors.buttonColor,
                    todayStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                        color: AppColors.redColor)),
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
