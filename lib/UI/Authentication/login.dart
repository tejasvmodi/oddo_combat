import 'package:flutter/material.dart';
import 'package:oddo_combat/Service/registration.dart';
import 'package:oddo_combat/UI/Authentication/register.dart';
import 'package:oddo_combat/UI/Resident%20Ui/resident_home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailID = TextEditingController();
  bool _showPassword = false;
  final _password = TextEditingController();
  var selectedrole = 'RESIDENT';
  List<String> role = ['RESIDENT', 'COLLECTOR'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
          height: MediaQuery.of(context).size.height * 0.7,
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
                    'Login',
                    style: TextStyle(color: Colors.black, fontSize: 40),
                  ),
                ),
                TextField(
                  controller: _emailID,
                  decoration: const InputDecoration(
                    label: Text('Enter Email Id '),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                TextField(
                  obscureText: !_showPassword,
                  controller: _password,
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
                      label: const Text('Enter Password Id '),
                      border: const OutlineInputBorder(
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
                    onPressed: () {
                      Authenticationservice auth = Authenticationservice();
                      auth.loginUser(_emailID.text, _password.text, selectedrole);
                    },
                    child: const Text(
                      'Sign In',
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
                          builder: (context) => const Registration(),
                        ));
                  },
                  child: const Text("Don't have a account ?"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
