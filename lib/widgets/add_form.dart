import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_adopt_app/providers/pets_provider.dart';
import 'package:provider/provider.dart';

class AddPetForm extends StatefulWidget {
  const AddPetForm({super.key});

  @override
  State<AddPetForm> createState() => AddPetFormState();
}

String name = "";
double age = 0;
String gender = "";

var _image;
final _picker = ImagePicker();

class AddPetFormState extends State<AddPetForm> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final genderController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              hintText: "Pet's name",
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "please fill out this field";
              } else {
                return null;
              }
            },
            onSaved: (value) {
              name = value!;
            },
          ),
          TextFormField(
            controller: ageController,
            decoration: const InputDecoration(
              hintText: "Pet's age",
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "please fill out this field";
              } else if (double.tryParse(value) == null) {
                return "please enter a number";
              }
              return null;
            },
            onSaved: (value) {
              age = double.parse(value!);
            },
          ),
          TextFormField(
            controller: genderController,
            decoration: const InputDecoration(
              hintText: "Pet's gender",
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "please fill out this field";
              } else {
                return null;
              }
            },
            onSaved: (value) {
              gender = value!;
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      final XFile? image =
                          await _picker.pickImage(source: ImageSource.gallery);
                      setState(() {
                        _image = File(image!.path);
                      });
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      margin: const EdgeInsets.only(top: 20),
                      // decoration: BoxDecoration(color: Colors.blue[200]),
                      child: _image != null
                          ? Image.file(
                              _image,
                              width: 200.0,
                              height: 200.0,
                              fit: BoxFit.fitHeight,
                            )
                          : Container(
                              // decoration:
                              //     BoxDecoration(color: Colors.blue[200]),
                              width: 200,
                              height: 200,
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.blueGrey,
                                size: 75,
                              ),
                            ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Select an image"),
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Center(
              child: ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    await context.read<PetsProvider>().addPets(
                          name: nameController.text,
                          age: ageController.text,
                          gender: genderController.text,
                          image: _image!,
                        ); // CHECK
                    context.pop();
                  }
                },
                child: const Text(
                  "Add",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
