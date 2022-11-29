import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_adopt_app/models/pet_model.dart';

import '../widgets/add_form.dart';
import '../widgets/edit_form.dart';

class EditPetPage extends StatelessWidget {
  final PetModel pet;
  EditPetPage({required this.pet, super.key});

  final titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Pet")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            EditPetForm(pet: pet),
          ],
        ),
      ),
    );
  }
}
