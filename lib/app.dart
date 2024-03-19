import 'package:flutter/material.dart';
import 'package:dropdownfield2/dropdownfield2.dart';

import 'details.dart';

List<String> cities = [
  'Bangalore',
  'Chennai',
  'New York',
  'Mumbai',
  'Delhi',
  'Tokyo',
];

class App extends StatefulWidget {
  const App({super.key});

  @override
  State createState() => _AppState();
}

class _AppState extends State<App> {
  final _formKey = GlobalKey<FormState>();
  final cityController = TextEditingController();
  final notifier = ValueNotifier(<String>[]);

  Map<String, String> formData = {'City': 'Bangalore'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Weather Now'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
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
                              formData['City'] = newValue,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: IconButton(
                            onPressed: () async =>
                                searchCity(cityController.text),
                            icon: const Icon(Icons.arrow_right_alt)),
                      )
                    ],
                  ),
                )),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Last viewed'),
              ),
            ValueListenableBuilder(
              valueListenable: notifier,
              builder: (context, list, _) => ListView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () => goToDetails(context, list[index]),
                  child: ListTile(
                    title: Text(list[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => removeCity(list[index]),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  void searchCity(String city) {
    final updatedList = List<String>.from(notifier.value);

    if(!updatedList.contains(city)){
    updatedList.add(city);
    notifier.value = updatedList;
    }

    cityController.clear();
    goToDetails(context, city);
  }

  void removeCity(String city) {
    final updatedList = List<String>.from(notifier.value);
    updatedList.remove(city);
    notifier.value = updatedList;
  }

  void goToDetails(BuildContext context, String city) => Navigator.pushNamed(
        context,
        '/Details',
        arguments: DetailsConfig(city: city),
      );
}
