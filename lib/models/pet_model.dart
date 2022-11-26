class PetModel {
  String name;
  int age;
  String gender;
  String image;

  PetModel({
    required this.name,
    required this.age,
    required this.gender,
    required this.image,
  });

  factory PetModel.fromJson(Map<String, dynamic> json) {
    return PetModel(
      name: json['name'],
      age: json['age'],
      gender: json['gender'],
      image: json['image'],
    );
  }
}
