class FruitModel {
  final String name;
  final String  image;
  final String  description;
  final num rate;
  final num   price;
  List<String> nutrition;

  FruitModel(
      {required this.nutrition,
        required this.name,
      required this.image,
      required this.description,
      required this.rate,
      required this.price});

  factory FruitModel.fromJson(json) {
    List<String> nut=[];
    json["nutrition"].forEach((element){nut.add(element);});
    return FruitModel(nutrition: nut,
        name: json["name"],
        image: json["image"],
        description: json["description"],
        rate: json["rate"],
        price: json["price"]);
  }
}
