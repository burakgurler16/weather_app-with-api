import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:week_of_year/week_of_year.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    const String _appTitle = 'WEEKFO';
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(_appTitle),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Expanded(child: _InfoCard()), Expanded(child: _InfoCard())],
            ),
            Divider(),
            _CurrentWeekCard(context),
            Divider(),
            Expanded(child: _dayList())
          ],
        ),
      ),
    );
  }

  Card _CurrentWeekCard(BuildContext context) {
    return Card(
      color: Colors.amber[200],
      child: Container(
        child: Text(
          thisWeek(),
          style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.black),
        ),
        margin: const EdgeInsets.all(5.0),
        width: MediaQuery.of(context).size.width,
        height: 20.0,
        alignment: Alignment.center,
      ),
    );
  }

  String thisWeek() {
    final now = DateTime.now();
    final dayOfWeek = DateFormat('E');
    String day = dayOfWeek.format(now);
    return ('${now.weekOfYear}. Hafta\n$day');
  }

  ListView _dayList() {
    return ListView(
      children: const [
        _DaysCard(day: 'pazartesi'),
        _DaysCard(day: 'salı'),
        _DaysCard(day: 'çarşamba'),
        _DaysCard(day: 'perşembe'),
        _DaysCard(day: 'cuma'),
        _DaysCard(day: 'cumartesi'),
        _DaysCard(day: 'pazar'),
      ],
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber,
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        height: 150,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('deneme card'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(
                    FontAwesomeIcons.sun,
                    size: 50,
                    color: Colors.white,
                  ),
                  Text('17°')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _DaysCard extends StatelessWidget {
  const _DaysCard({
    Key? key,
    required this.day,
  }) : super(key: key);
  final String day;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber,
      child: Container(
        child: Text(
          day,
          style: Theme.of(context).textTheme.headline4?.copyWith(color: Colors.black),
        ),
        margin: const EdgeInsets.all(10.0),
        width: 48.0,
        height: 48.0,
        alignment: Alignment.center,
      ),
    );
  }
}
