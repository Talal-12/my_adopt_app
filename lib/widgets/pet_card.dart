import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_adopt_app/providers/pets_provider.dart';
import 'package:provider/provider.dart';

import '../models/pet_model.dart';

class PetCard extends StatelessWidget {
  final PetModel pet;
  const PetCard({Key? key, required this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              pet.image,
              fit: BoxFit.fitHeight,
              width: double.infinity,
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Text(
                      pet.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2, bottom: 2),
                    child: Text(
                      "Age: ${pet.age}",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      "Gender: ${pet.gender}",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Adopt",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          iconSize: 30,
                          onPressed: () => context.push("/edit", extra: pet),
                          icon: const Icon(Icons.edit)),
                      IconButton(
                          iconSize: 28,
                          onPressed: () => context
                              .read<PetsProvider>()
                              .deletePet(pet.id as int),
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ))
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
