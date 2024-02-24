import 'package:flutter/material.dart';
import 'package:dropdownfield2/dropdownfield2.dart';

import 'details.dart';

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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: DropDownField(
                            controller: cityController,
                            value: formData['City'],
                            icon: const Icon(Icons.location_city),
                            required: true,
                            labelText: 'City *',
                            items: cities,
                            setter: (dynamic newValue) =>
                                formData['City'] = newValue),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: IconButton(
                            onPressed: () async => goToDetails(context,cityController.text),
                            icon: const Icon(Icons.arrow_right_alt)),
                      )
                    ],
                  ),
                  Divider(height: 10.0, color: Theme.of(context).primaryColor),
                ],
              ),
            ))));
  }

  void goToDetails(BuildContext context, String city) => Navigator.pushNamed(
        context,
        '/Details',
        arguments: DetailsConfig(city: city),
      );

}
