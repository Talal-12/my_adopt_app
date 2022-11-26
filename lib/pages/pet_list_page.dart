import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../providers/pet_provider.dart';

class PetListPage extends StatelessWidget {
  PetListPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pet Adopt"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          context.read<PetProvider>().loadPets();
        },
      ),
      body: context.watch<PetProvider>().isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: () async {
                await context.read<PetProvider>().loadPets;
              },
              child: ListView.builder(
                  itemCount: context.watch<PetProvider>().pets.length,
                  itemBuilder: (context, index) {
                    var petProvider = context.watch<PetProvider>();
                    var pet = petProvider.pets[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 3.0),
                          child: Text(pet.name),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("age: ${pet.age}"),
                            Text("gender: ${pet.gender}"),
                          ],
                        ),
                        leading: Image.network(
                          pet.image,
                          width: 60,
                        ),
                      ),
                    );
                  }),
            ),
    );
  }
}
