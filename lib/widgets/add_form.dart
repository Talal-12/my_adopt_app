import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddPetForm extends StatefulWidget {
  const AddPetForm({super.key});

  @override
  State<AddPetForm> createState() => AddPetFormState();
}

String name = "";
double age = 0;
String gender = "";

class AddPetFormState extends State<AddPetForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
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
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
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
