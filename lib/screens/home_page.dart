import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  _InfoCard(),
                  _InfoCard(),
                ],
              ),
            ),
            Expanded(
                flex: 7,
                child: ListView(
                  children: const [
                    _DaysCard(day: 'pazartesi'),
                    _DaysCard(day: 'salı'),
                    _DaysCard(day: 'çarşamba'),
                    _DaysCard(day: 'perşembe'),
                    _DaysCard(day: 'cuma'),
                    _DaysCard(day: 'cumartesi'),
                    _DaysCard(day: 'pazar'),
                  ],
                ))
          ],
        ),
      ),
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
        width: MediaQuery.of(context).size.width / 3,
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
