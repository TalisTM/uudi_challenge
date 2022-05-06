import 'package:uudi_challenge/entities/product_entity.dart';

class CardItemEntity {
  ProductEntity product;
  int quantity;

  CardItemEntity({
    required this.product,
    required this.quantity,
  });

}
