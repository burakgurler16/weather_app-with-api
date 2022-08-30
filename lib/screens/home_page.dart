// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  bool isLoading = false;

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
      padding: const EdgeInsets.symmetric(),
      children: const [
        _DaysButton(day: 'pazartesi'),
        _DaysButton(day: 'salı'),
        _DaysButton(day: 'çarşamba'),
        _DaysButton(day: 'perşembe'),
        _DaysButton(day: 'cuma'),
        _DaysButton(day: 'cumartesi'),
        _DaysButton(day: 'pazar'),
      ],
    );
  }
}

class _DaysButton extends StatelessWidget {
  const _DaysButton({
    Key? key,
    // required this.context,
    required this.day,
  }) : super(key: key);

  // final BuildContext context;
  final String day;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: CustomFootButton(
          title: day,
          onPressed: () {},
        ));
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

class _ColorsUtility {
  final Color daysColor = const Color.fromARGB(255, 194, 155, 39);
  final Color white = Colors.white;
}

class _PaddingUtility {
  final EdgeInsets normalPadding = const EdgeInsets.all(8.0);
  final EdgeInsets normal2xPadding = const EdgeInsets.all(16.0);
}

class CustomFootButton extends StatelessWidget with _ColorsUtility, _PaddingUtility {
  CustomFootButton({Key? key, required this.title, required this.onPressed}) : super(key: key);
  final String title;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: daysColor, shape: const StadiumBorder()),
        onPressed: onPressed,
        child: Padding(
          padding: normal2xPadding,
          child: Text(
            title,
            style: Theme.of(context).textTheme.subtitle2?.copyWith(color: white, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
