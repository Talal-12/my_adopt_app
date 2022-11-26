class PetModel {
  int? id;
  String name;
  String image;
  int age;
  bool adopted;
  String gender;

  PetModel(
      {this.id,
      required this.name,
      required this.image,
      this.adopted = false,
      required this.age,
      required this.gender});

  PetModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String,
        adopted = json['adopted'] as bool,
        image = json['image'] as String,
        age = json['age'] as int,
        gender = json['gender'] as String;
}


// OLD MODEL:

// class PetModel {
//   String name;
//   int age;
//   String gender;
//   String image;

//   PetModel({
//     required this.name,
//     required this.age,
//     required this.gender,
//     required this.image,
//   });

//   factory PetModel.fromJson(Map<String, dynamic> json) {
//     return PetModel(
//       name: json['name'],
//       age: json['age'],
//       gender: json['gender'],
//       image: json['image'],
//     );
//   }
// }
