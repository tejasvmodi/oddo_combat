import 'package:flutter/material.dart';
import 'package:oddo_combat/UI/Resident%20Ui/pickupform.dart';
import 'package:oddo_combat/UI/Resident%20Ui/reportingsystem.dart';

class ResidentHome extends StatefulWidget {
  const ResidentHome({super.key});

  @override
  State<ResidentHome> createState() => _ResidentHomeState();
}

class _ResidentHomeState extends State<ResidentHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width * 0.8,
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.elliptical(
                  MediaQuery.of(context).size.width * 0.04,
                  MediaQuery.of(context).size.width * 0.04))),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
              TextButton(
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.elliptical(
                            MediaQuery.of(context).size.width * 0.02,
                            MediaQuery.of(context).size.width * 0.02),
                      ),
                    ),
                  ),
                  fixedSize: MaterialStatePropertyAll(Size(
                      MediaQuery.of(context).size.width * 0.7,
                      MediaQuery.of(context).size.height * 0.09)),
                  backgroundColor: const MaterialStatePropertyAll(
                    Color.fromARGB(255, 202, 212, 230),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Reportingsstem(),));
                },
                child: const Text(
                  'Reporting system ',
                  style: TextStyle(color: Colors.black,fontSize: 24),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
               TextButton(
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.elliptical(
                            MediaQuery.of(context).size.width * 0.02,
                            MediaQuery.of(context).size.width * 0.02),
                      ),
                    ),
                  ),
                  fixedSize: MaterialStatePropertyAll(Size(
                      MediaQuery.of(context).size.width * 0.7,
                      MediaQuery.of(context).size.height * 0.09)),
                  backgroundColor: const MaterialStatePropertyAll(
                    Color.fromARGB(255, 202, 212, 230),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'View Schedules ',
                  style: TextStyle(color: Colors.black,fontSize: 24),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
               TextButton(
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.elliptical(
                            MediaQuery.of(context).size.width * 0.02,
                            MediaQuery.of(context).size.width * 0.02),
                      ),
                    ),
                  ),
                  fixedSize: MaterialStatePropertyAll(Size(
                      MediaQuery.of(context).size.width * 0.7,
                      MediaQuery.of(context).size.height * 0.09)),
                  backgroundColor: const MaterialStatePropertyAll(
                    Color.fromARGB(255, 202, 212, 230),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context) => PickupForm()));
                },
                child: const Text(
                  'Special PickUp',
                  style: TextStyle(color: Colors.black,fontSize: 24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
