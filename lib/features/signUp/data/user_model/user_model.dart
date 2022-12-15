class UserModel {
  final String name, email, password,uId;
      final String?image;

  UserModel({required this.image,required this.name, required this.email, required this.password,required  this.uId,});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(image:json["image"],
        uId: json["uid"],
        name: json["name"], email: json["email"], password: json["password"]);
  }

  Map<String, dynamic> toJson() {
    return {"uid":uId,
      "image":image,
      "name": name, "password": password, "email": email};
  }
}
