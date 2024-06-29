import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:oddo_combat/Util/util.dart';

class Reportingsstem extends StatefulWidget {
  const Reportingsstem({super.key});

  @override
  State<Reportingsstem> createState() => _ReportingsstemState();
}

class _ReportingsstemState extends State<Reportingsstem> {
  final ImagePicker _picker = ImagePicker();
  XFile? pickedFile;
  String? currentLocation;

  Future<void> _getImage(ImageSource source) async {
    final pickedFileResult = await _picker.pickImage(source: source);
    if (pickedFileResult != null) {
      setState(() {
        pickedFile = pickedFileResult;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var description = TextEditingController();
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.all(
              Radius.elliptical(MediaQuery.of(context).size.width * 0.04,
                  MediaQuery.of(context).size.width * 0.04),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                const Text(
                  'Report Garbage',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.08),
                  child: TextField(
                    controller: description,
                    maxLength: 500,
                    maxLines: 2,
                    decoration: const InputDecoration(
                        label: Text('Enter Description of Garbage'),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                pickedFile != null
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.file(
                            File(
                              pickedFile!.path,
                            ),
                          ),
                        ))
                    : GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: const Center(
                            child: Text(
                              'Click the image',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                        ),
                        onTap: () => _getImage(ImageSource.camera),
                      ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
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
                            MediaQuery.of(context).size.width * 0.4,
                            MediaQuery.of(context).size.height * 0.05)),
                        backgroundColor: const MaterialStatePropertyAll(
                          Color.fromARGB(255, 222, 202, 230),
                        ),
                      ),
                      onPressed: () => _getImage(ImageSource.camera),
                      child: const Text(
                        'Camera',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    ElevatedButton(
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
                            MediaQuery.of(context).size.width * 0.4,
                            MediaQuery.of(context).size.height * 0.05)),
                        backgroundColor: const MaterialStatePropertyAll(
                          Color.fromARGB(255, 222, 202, 230),
                        ),
                      ),
                      onPressed: () => _getImage(ImageSource.gallery),
                      child: const Text(
                        'Gallery',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
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
                    showSnackkBar(
                      message: 'Successfully created',
                      title: 'Noted',
                      icon: const Icon(Icons.note_add),
                    );
                  },
                  child: const Text(
                    'Submit Report ',
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
