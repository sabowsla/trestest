import 'dart:math';

import 'package:flutter/material.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({Key? key}) : super(key: key);

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  List<int> month = List.generate(31, (index) => index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calendar View",
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "May",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "2022",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "and everyday is a",
              style: TextStyle(
                color: Colors.black,
                fontSize: 10,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 7,
                children: month.map((e) {
                  return DayInCalendar(value: e);
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DayInCalendar extends StatefulWidget {
  final int? value;
  const DayInCalendar({
    Key? key,
    this.value,
  }) : super(key: key);

  @override
  State<DayInCalendar> createState() => _DayInCalendarState();
}

class _DayInCalendarState extends State<DayInCalendar> {
  bool tap = false;
  void onTap() {
    setState(() {
      tap = !tap;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1),
      color: Colors.primaries[Random.secure().nextInt(Colors.primaries.length)],
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: tap
              ? Image.asset(Random.secure().nextInt(2) == 0
                  ? "assets/wow.png"
                  : "assets/poop.png")
              : Text(
                  widget.value.toString(),
                ),
        ),
      ),
    );
  }
}
