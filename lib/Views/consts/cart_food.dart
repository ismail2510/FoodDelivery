
class CartFood {
  String? key;
  String? imagepath;
  String? name;
  double? price;
  int? count;
  bool? faved = false;
  CartFood({
    required this.key,
    required this.imagepath,
    this.name,
    required this.price,
    required this.count,
    this.faved,
  });

  CartFood.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    imagepath = json['imagepath'];
    name = json['name'];
    price = json['price'];
    count = json['count'];
    faved = json['faved'];
  }

 toJson( ) {
   Map<String, dynamic> data={};
    data['key'] = key;
    data['imagepath'] = imagepath;
    data['name'] = name;
    data['price'] = price;
    data['count'] = count;
    data['faved'] = faved;
    throw (0);
  }
}
