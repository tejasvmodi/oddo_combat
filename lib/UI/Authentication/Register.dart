import 'package:flutter/material.dart';
import 'package:oddo_combat/UI/Authentication/login.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  bool _showPassword = false;
  bool _confirmshowpassword = false;

  var email = TextEditingController();
  var Password = TextEditingController();
  var confirmpassword = TextEditingController();
  var phonenumber = TextEditingController();
  var name = TextEditingController();
  var selectedrole = 'Resident';
  List<String> role = ['Resident', 'Garbage Collectors'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.elliptical(
                  MediaQuery.of(context).size.width * 0.04,
                  MediaQuery.of(context).size.width * 0.04))),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.08),
                  child: const Text(
                    'Registration',
                    style: TextStyle(color: Colors.black, fontSize: 40),
                  ),
                ),
                TextField(
                  controller: name,
                  decoration: const InputDecoration(
                      label: Text('Enter name '),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                TextField(
                  controller: email,
                  decoration: const InputDecoration(
                      label: Text('Enter Email Id '),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                TextField(
                   obscureText: !_showPassword,
                  controller: Password,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          _showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                      ),
                      label: Text('Enter Password Id '),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                TextField(
                   obscureText: !_confirmshowpassword,
                  controller: confirmpassword,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          _confirmshowpassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _confirmshowpassword = !_confirmshowpassword;
                          });
                        },
                      ),
                      label: Text('Enter Confirm Password Id '),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.all(
                      Radius.elliptical(
                          MediaQuery.of(context).size.width * 0.04,
                          MediaQuery.of(context).size.width * 0.04),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.03),
                    child: DropdownButton<String>(
                      alignment: Alignment.bottomLeft,
                      isExpanded: true,
                      value: selectedrole,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 25,
                      style: const TextStyle(color: Colors.black),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedrole = newValue!;
                        });
                      },
                      items: role.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                TextButton(
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
                    onPressed: () {},
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ));
                  },
                  child: const Text('Already have a Account ?'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
