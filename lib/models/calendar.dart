import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

class CalendarModel extends StatefulWidget {
  const CalendarModel({Key? key}) : super(key: key);

  @override
  State<CalendarModel> createState() => _CalendarModelState();
}

class _CalendarModelState extends State<CalendarModel> {
  // 현재 날짜를 기준으로 달력을 생성한다. 월을 변경하는 기능이 포함되어 있으며, test_date를 기반으로 달력에 연속 금연 성공을 표기한다
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

  final List<int> test_date = [
    2,
    12,
    15,
    21
  ]; // 금연 성공 연속의 시작과 끝을 포함 => 2~12일, 15~21일 금연 성공
  final List<int> test_date_bad = [13, 14]; // 금연 실패 날짜
  final List<int> test_date_diary = [6, 12, 15, 19]; // 금연일지가 작성된 날짜

  List<Widget> calendar_full = []; // 그려지는 캘린더
  int date_num = 0; // 선택한 날짜

  List<Widget> calc_date(DateTime date) {
    List<int> calendar_date_list_pre = []; // 이전 달의 날짜
    List<int> calendar_date_list = []; // 선택한 달의 날짜
    List<int> calendar_date_list_next = []; // 다음 달의 날짜
    List<Widget> _calendar_full = []; // 반환 값, 여러 주(calendar_week)를 Column으로 묶은
    List<Widget> calendar_week = []; // 주 단위로 날짜를 Row로 묶은

    DateTime date_tmp = DateTime(date.year, date.month, 1); // 해당 달 첫 날
    DateTime last_date = DateTime(date.year, date.month + 1, 0); // 해당 달 마지막 날
    int tmp = date_list.indexOf(DateFormat('E')
        .format(DateTime(date.year, date.month, 1))); // 해당 달 첫 날의 요일을 숫자로

    while (tmp != 0) {
      // 해당 달의 시작이 토요일이 아닌 경우, 이전 달을 일부 포함
      date_tmp = DateTime(date_tmp.year, date_tmp.month, date_tmp.day - 1);
      // calendar_date_list_pre.add(date_tmp.day);
      calendar_date_list_pre.insert(0, date_tmp.day);
      calendar_date_list.insert(0, date_tmp.day);
      tmp -= 1;
    }

    int i = 1;

    while (i <= last_date.day) {
      // 해당 달 요일 추가
      calendar_date_list.add(i);
      i += 1;
    }

    tmp = date_list.indexOf(DateFormat('E').format(last_date));

    while (tmp != 6) {
      // 해당 달 마지막 날이 일요일이 아닌 경우, 다음 달의 일부 포함
      last_date = DateTime(last_date.year, last_date.month, last_date.day + 1);
      calendar_date_list.add(last_date.day);
      calendar_date_list_next.add(last_date.day);
      tmp += 1;
    }

    bool date_checker = false;

    for (i = 0; i < calendar_date_list.length; i++) {
      if (i < calendar_date_list_pre.length ||
          calendar_date_list.length - i <= calendar_date_list_next.length) {
        // 이전달 또는 다음달 날짜인 경우
        calendar_week.add(calendar_text_maker(
          date: calendar_date_list[i].toString(),
          date_color: Colors.grey,
          block: 1,
        ));
      } else if (test_date.contains(calendar_date_list[i])) {
        // 연속 금연의 시작 또는 끝
        if (date_checker) {
          // 연속 금연 끝
          calendar_week.add(calendar_text_maker(
            date: calendar_date_list[i].toString(),
            date_color: Colors.white,
            date_decoration: BoxDecoration(
              color: const Color(0xffFEC226),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              border: Border.all(
                color: const Color(0xffFEC226),
              ),
            ),
            is_diary: test_date_diary.contains(calendar_date_list[i]),
          ));
          date_checker = false;
        } else {
          // 연속 금연 시작
          calendar_week.add(calendar_text_maker(
            date: calendar_date_list[i].toString(),
            date_color: Colors.white,
            date_decoration: BoxDecoration(
              color: const Color(0xffFEC226),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              border: Border.all(
                color: const Color(0xffFEC226),
              ),
            ),
            is_diary: test_date_diary.contains(calendar_date_list[i]),
          ));
          date_checker = true;
        }
      } else if (date_checker) {
        // 연속 금연 기간의 사이
        calendar_week.add(calendar_text_maker(
          date: calendar_date_list[i].toString(),
          date_color: Colors.white,
          date_decoration: BoxDecoration(
            color: const Color(0xffFEC226),
            border: Border.all(
              color: const Color(0xffFEC226),
            ),
          ),
          is_diary: test_date_diary.contains(calendar_date_list[i]),
        ));
      } else if (test_date_bad.contains(calendar_date_list[i])) {
        // 흡연을 한 날
        calendar_week.add(calendar_text_maker(
          date: calendar_date_list[i].toString(),
          date_color: Colors.white,
          date_decoration: const BoxDecoration(
            color: Color(0xffEC6A5C),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          date_margin: EdgeInsets.all(3),
        ));
      } else {
        // 나머지
        calendar_week.add(calendar_text_maker(
          date: calendar_date_list[i].toString(),
          date_color: Colors.black,
        ));
      }

      if ((i + 1) % 7 == 0) {
        // 주가 바뀌는 경우, 즉 일요일인 경우
        _calendar_full.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: calendar_week,
        ));
        calendar_week = [];
      }
    }
    return _calendar_full;
  }

  void min_month() {
    // 이전 달로
    DateTime tmp = DateTime(now.year, now.month, 0);
    setState(() {
      now = tmp;
      calendar_full = calc_date(tmp);
      date_num = 0;
    });
  }

  void add_month() {
    // 다음 달로
    DateTime tmp = DateTime(now.year, now.month + 1, 1);
    setState(() {
      now = tmp;
      calendar_full = calc_date(tmp);
      date_num = 0;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      calendar_full = calc_date(now);
    });
  }

  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비

    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () => min_month(),
              child: const Icon(Icons.arrow_left),
            ),
            Text(DateFormat('MMM y').format(now)),
            GestureDetector(
              onTap: () => add_month(),
              child: const Icon(Icons.arrow_right),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(date_list[0]),
            Text(date_list[1]),
            Text(date_list[2]),
            Text(date_list[3]),
            Text(date_list[4]),
            Text(date_list[5]),
            Text(date_list[6]),
          ],
        ),
        Column(
          children: calendar_full,
        ),
        SizedBox(height: valHeight * 0.03),
        Container(
          width: valWidth * 0.9,
          height: valHeight * 0.23,
          decoration: BoxDecoration(
              color: const Color(0xff1F1F1F),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                DateFormat('M').format(now) +
                    ' 월 ' +
                    date_num.toString() +
                    ' 일',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: valHeight * 0.03,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: valHeight * 0.04),
              Text(
                '아직 금연일지가 작성되어 있지 않습니다.',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: valHeight * 0.02,
                    fontWeight: FontWeight.normal),
              ),
              const IconButton(
                padding: EdgeInsets.all(0.0),
                onPressed: null,
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 50,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget calendar_text_maker({
    // 캘린더에서 각각의 날짜에 해당하는 위젯 반환
    required String date,
    required Color date_color,
    int? block,
    BoxDecoration? date_decoration,
    EdgeInsets date_margin = const EdgeInsets.only(top: 3, bottom: 3),
    bool is_diary = false, // 해당 날짜에 일지가 있는지
  }) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          if (block != 1) {
            // 이전달 이나 다음달에 해당하는 날짜이면 날짜 선택 불가능하게
            setState(() {
              date_num = int.parse(date);
            });
          }
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 60,
              margin: date_margin,
              decoration: date_decoration,
              child: Center(
                child: Text(
                  date,
                  style: TextStyle(
                    color: date_color,
                  ),
                ),
              ),
            ),
            if (is_diary)
              Container(
                margin: EdgeInsets.only(
                    bottom: textSize(date).height + 4,
                    left: textSize(date).width + 4),
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }

  TextPainter textSize(String text) {
    // 날짜 글씨의 크기 계산
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text),
      maxLines: 1,
      textAlign: TextAlign.center,
      textDirection: ui.TextDirection.rtl,
    )..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter;
  }
}
