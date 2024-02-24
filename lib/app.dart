import 'package:flutter/material.dart';
import 'package:dropdownfield2/dropdownfield2.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State createState() => _AppState();
}

class _AppState extends State<App> {
  final _formKey = GlobalKey<FormState>();
  final cityController = TextEditingController();

  Map<String, String> formData = {'City': 'Bangalore'};
  List<String> cities = [
    'Bangalore',
    'Chennai',
    'New York',
    'Mumbai',
    'Delhi',
    'Tokyo',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Weather Now'),
        ),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  ValueListenableBuilder(
                      valueListenable: cityController,
                      builder: (context, formData, _) {
                        return Text(cityController.text);
                      }),
                  DropDownField(
                      controller: cityController,
                      value: formData['City'],
                      icon: const Icon(Icons.location_city),
                      required: true,
                      labelText: 'City *',
                      items: cities,
                      setter: (dynamic newValue) => formData['City'] = newValue),
                  Divider(height: 10.0, color: Theme.of(context).primaryColor),
                ],
              ),
            ))));
  }
}
