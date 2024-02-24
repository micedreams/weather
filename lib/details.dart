import 'package:flutter/material.dart';

import '../end_point.dart';

class Details extends StatefulWidget {
  const Details({
    super.key,
    required this.config,
  });

  final DetailsConfig config;

  @override
  State createState() => _DetailsState();
}

class DetailsConfig extends ChangeNotifier {
  DetailsConfig({
    required this.city,
  });

  final String city;
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(widget.config.city)),
        body: FutureBuilder(
            future: getWeather(widget.config.city),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              if ('SocketException' == snapshot.data) {
                return const ListTile(
                  title: Text('No internet'),
                  subtitle: Text('Please try again later.'),
                );
              }

              final city = snapshot.data;

              return RefreshIndicator(
                onRefresh: () async => await getWeather(widget.config.city),
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      title: const Text('temperature'),
                      subtitle: Text('${city.temperature} °C'),
                    ),
                    ListTile(
                      title: const Text('weather'),
                      subtitle: Text('${city.weather}'),
                    ),
                    ListTile(
                      title: const Text('humidity'),
                      subtitle: Text('${city.humidity} g.m-3'),
                    ),
                    ListTile(
                      title: const Text('windSpeed'),
                      subtitle: Text('${city.windSpeed} km/h'),
                    ),
                  ],
                ),
              );
            }),
      );
}
