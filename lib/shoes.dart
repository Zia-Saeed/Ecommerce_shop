import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Shoes {
  Shoes({
    required this.brandName,
    required this.price,
    required this.size,
    required this.imageUrl,
    required this.title,
  }) : id = uuid.v4();
  final String id;
  final String brandName;
  final double price;
  List<String> size;
  final String imageUrl;
  final String title;
}
