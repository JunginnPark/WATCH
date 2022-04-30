import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarModel extends StatefulWidget {
  const CalendarModel({Key? key}) : super(key: key);

  @override
  State<CalendarModel> createState() => _CalendarModelState();
}

class _CalendarModelState extends State<CalendarModel> {
  DateTime now = DateTime.now();
  final List<String> date_list = [
    "Sun",
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
  ];

  List<Widget> calendar_full = [];
  // late String first_date_when;

  List<Widget> calc_date(DateTime date) {
    List<int> calendar_date_list_pre = [];
    List<int> calendar_date_list = [];
    List<int> calendar_date_list_next = [];
    List<Widget> _calendar_full = [];
    List<Widget> calendar_week = [];

    DateTime date_tmp = DateTime(date.year, date.month, 1);
    DateTime last_date = DateTime(date.year, date.month + 1, 0);
    int tmp = date_list
        .indexOf(DateFormat('E').format(DateTime(date.year, date.month, 1)));

    while (tmp != 0) {
      date_tmp = DateTime(date_tmp.year, date_tmp.month, date_tmp.day - 1);
      // calendar_date_list_pre.add(date_tmp.day);
      calendar_date_list_pre.insert(0, date_tmp.day);
      calendar_date_list.insert(0, date_tmp.day);
      tmp -= 1;
    }

    int i = 1;

    while (i <= last_date.day) {
      calendar_date_list.add(i);
      i += 1;
    }

    tmp = date_list.indexOf(DateFormat('E').format(last_date));

    while (tmp != 6) {
      last_date = DateTime(last_date.year, last_date.month, last_date.day + 1);
      calendar_date_list.add(last_date.day);
      calendar_date_list_next.add(last_date.day);
      tmp += 1;
    }

    // print(calendar_date_list_pre);
    // print(calendar_date_list);
    // print(calendar_date_list_next);

    for (i = 0; i < calendar_date_list.length; i++) {
      if (i < calendar_date_list_pre.length ||
          calendar_date_list.length - i <= calendar_date_list_next.length) {
        calendar_week.add(Expanded(
          child: SizedBox(
            height: 60,
            child: Center(
              child: Text(
                calendar_date_list[i].toString(),
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ));
      } else {
        calendar_week.add(Expanded(
          child: SizedBox(
            height: 60,
            child: Center(
              child: Text(
                calendar_date_list[i].toString(),
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ));
      }

      if ((i + 1) % 7 == 0) {
        _calendar_full.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: calendar_week,
        ));
        calendar_week = [];
      }
    }
    return _calendar_full;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      calendar_full = calc_date(now);
    });
  }

  void min_month() {
    DateTime tmp = DateTime(now.year, now.month, 0);
    setState(() {
      now = tmp;
      calendar_full = calc_date(tmp);
    });
  }

  void add_month() {
    DateTime tmp = DateTime(now.year, now.month + 1, 1);
    setState(() {
      now = tmp;
      calendar_full = calc_date(tmp);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(now);

    // print(first_date_when);
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () => min_month(),
              child: Icon(Icons.arrow_left),
            ),
            Text(DateFormat('MMM y').format(now)),
            GestureDetector(
              onTap: () => add_month(),
              child: Icon(Icons.arrow_right),
            ),
          ],
        ),
        Column(
          children: calendar_full,
        ),
      ],
    );
  }
}
