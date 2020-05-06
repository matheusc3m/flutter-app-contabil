import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class Calendario extends StatefulWidget {
  @override
  _CalendarioState createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  var dataAtual = new DateTime.now();
  var formatter = new DateFormat('dd-MM-yyyy');
  var formatterCalendar = new DateFormat('MM-yyyy');
  CalendarController calendarController;
  String dataFormatada;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calendarController = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: TableCalendar(
          calendarController: calendarController,
          locale: "pt_BR",
          headerStyle: HeaderStyle(
            formatButtonShowsNext: false,
            formatButtonVisible: false,
            centerHeaderTitle: true,
          ),
          calendarStyle: CalendarStyle(outsideDaysVisible: false),
          daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: TextStyle(color: Colors.transparent),
            weekendStyle: TextStyle(color: Colors.transparent),
          ),
          rowHeight: 0,
          initialCalendarFormat: CalendarFormat.month,
          onVisibleDaysChanged: (dateFirst, dateLast, CalendarFormat cf) {
            print(dateFirst);

            dataFormatada = formatterCalendar.format(dateFirst);
            // _allMovMes(dataFormatada);

            print("DATA FORMATADA CALENDAR $dataFormatada");

            //print("Data Inicial: $dateFirst ....... Data Final: $dateLast");
          },
        ),
      ),
    );
  }
}
