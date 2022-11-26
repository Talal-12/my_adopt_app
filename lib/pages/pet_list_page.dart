import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_adopt_app/models/pet_model.dart';
import 'package:provider/provider.dart';

import '../providers/pet_provider.dart';
import '../widgets/pet_card.dart';

class PetListPage extends StatelessWidget {
  PetListPage();

  @override
  Widget build(BuildContext context) {
    List<PetModel> pets = Provider.of<PetProvider>(context, listen: false).pets;
    return Scaffold(
      appBar: AppBar(
        title: Text("Pet Adoption"),
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
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text("Add a new Pet"),
                      ),
                    ),
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height),
                      ),
                      physics: const BouncingScrollPhysics(), // <- Here
                      itemCount: context.watch<PetProvider>().pets.length,
                      itemBuilder: (context, index) =>
                          PetCard(pet: pets[index])),
                ],
              ),
              // ListView.builder(
              //     itemCount: context.watch<PetProvider>().pets.length,
              //     itemBuilder: (context, index) {
              //       var petProvider = context.watch<PetProvider>();
              //       var pet = petProvider.pets[index];
              //       return Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: ListTile(
              //           title: Padding(
              //             padding: const EdgeInsets.only(bottom: 3.0),
              //             child: Text(pet.name),
              //           ),
              //           subtitle: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text("age: ${pet.age}"),
              //               Text("gender: ${pet.gender}"),
              //             ],
              //           ),
              //           leading: Image.network(
              //             pet.image,
              //             width: 60,
              //           ),
              //         ),
              //       );
              //     }),
            ),
    );
  }
}
