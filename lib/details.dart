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
        body: Text('widget.config.city') );
}
