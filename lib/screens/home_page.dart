import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:week_of_year/week_of_year.dart';

import 'package:weather/utils/weather.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
    required this.weatherData,
  }) : super(key: key);

  WeatherData weatherData;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? tepmperature;
  String? locationPoint;
  String? currentCondition;

  void updateDisplayInfo(WeatherData weatherData) {
    setState(() {
      tepmperature = weatherData.temperature;
      locationPoint = weatherData.locationPoint;
      currentCondition = weatherData.currentCondition;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateDisplayInfo(widget.weatherData);
  }

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
              children: [
                Expanded(
                    child: _InfoCard(
                  currentCondition: currentCondition,
                )),
                Expanded(
                    child: _InfoCard(
                  currentCondition: currentCondition,
                ))
              ],
            ),
            const Divider(),
            Text(locationPoint.toString()),
            _currentWeekCard(context),
            const Divider(),
            Expanded(child: _dayList())
          ],
        ),
      ),
    );
  }

  Card _currentWeekCard(BuildContext context) {
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

class _InfoCard extends StatefulWidget {
  _InfoCard({
    Key? key,
    this.temp,
    required this.currentCondition,
  }) : super(key: key);
  double? temp;
  String? currentCondition;

  @override
  State<_InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<_InfoCard> {
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
              Text('currentCondition'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(
                    FontAwesomeIcons.sun,
                    size: 50,
                    color: Colors.white,
                  ),
                  Text('')
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
