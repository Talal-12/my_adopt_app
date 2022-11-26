import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_adopt_app/models/pet_model.dart';

class PetsProvider extends ChangeNotifier {
  List<PetModel> pets = [];
  bool isLoading = true;

  PetsProvider() {
    getPets();
  }

  void getPets() async {
    isLoading = true;
    notifyListeners();

    // await a future (delay: 1 second)
    // await Future.delayed(Duration(seconds: 1));

    Dio client = Dio();

    var response =
        await client.get("https://coded-pets-api-crud.herokuapp.com/pets/");

    var body = response.data as List;

    // pets = [
    //   for (int i = 0; i < body.length; i++)
    //     PetModel(
    //         name: body[i]["name"],
    //         gender: body[i]["gender"],
    //         image: body[i]["image"]),
    // ];

    pets = body
        .map(
          (json) => PetModel.fromJson(json),
        )
        .toList();

    isLoading = false;
    notifyListeners();
  }
}
