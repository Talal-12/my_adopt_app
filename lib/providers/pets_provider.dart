import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_adopt_app/models/pet_model.dart';

class PetsProvider extends ChangeNotifier {
  List<PetModel> pets = [];
  bool isLoading = true;

  PetsProvider() {
    getPets();
  }

  Future<void> getPets() async {
    isLoading = true;
    notifyListeners();

    pets.clear();

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

  Future<void> addPets({
    required String name,
    required String age,
    required String gender,
    required File image,
  }) async {
    var client = Dio();

    await client.post("https://coded-pets-api-crud.herokuapp.com/pets/",
        data: FormData.fromMap({
          "name": name,
          "age": age,
          "gender": gender,
          "image": await MultipartFile.fromFile(image.path),
        }));

    getPets();
  }
}
