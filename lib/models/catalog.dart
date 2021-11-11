class catalogModel {
  static final items = [
    Items(
        id: 1,
        name: "Iphone 12 pro",
        desc: "kuch bhi",
        price: 900,
        color: "00000F",
        img: "asssets/images/login.png.png"),
  ];
}

class Items {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String img;

  Items(
      {required this.id,
      required this.name,
      required this.price,
      required this.desc,
      required this.color,
      required this.img});
}
