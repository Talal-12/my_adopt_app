import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/add_form.dart';

class AddPetPage extends StatelessWidget {
  AddPetPage({super.key});

  final titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add a Pet")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            AddPetForm(),
          ],
        ),
      ),
    );
  }
}
