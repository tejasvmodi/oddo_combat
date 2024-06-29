import 'package:flutter/material.dart';

class PickupForm extends StatefulWidget {
  @override
  _PickupFormState createState() => _PickupFormState();
}

class _PickupFormState extends State<PickupForm> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedState;
  String? _selectedCity;

  List<String> states = ['State 1', 'State 2', 'State 3'];
  List<String> cities = ['City 1', 'City 2', 'City 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Pick Up Form ',
          style: TextStyle(color: Colors.black, fontSize: 20),
        )),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.width ,
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
             ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a description';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Address Line 1',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter address line 1';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Address Line 2',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'State',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    value: _selectedState,
                    items: states.map((String state) {
                      return DropdownMenuItem<String>(
                        value: state,
                        child: Text(state),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedState = newValue;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a state';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'City',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    value: _selectedCity,
                    items: cities.map((String city) {
                      return DropdownMenuItem<String>(
                        value: city,
                        child: Text(city),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedCity = newValue;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a city';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(Size(
                              MediaQuery.of(context).size.width * 0.8,
                              MediaQuery.of(context).size.height * 0.09)),
                          shape: MaterialStatePropertyAll(
                            BeveledRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.elliptical(
                                    MediaQuery.of(context).size.width * 0.02,
                                    MediaQuery.of(context).size.width * 0.02),
                              ),
                            ),
                          ),
                          backgroundColor: const MaterialStatePropertyAll(
                              Color.fromARGB(255, 202, 212, 230))),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
