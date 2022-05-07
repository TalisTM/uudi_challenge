import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uudi_challenge/entities/product_entity.dart';

class GetProducts  {
  static Future<List<ProductEntity>> get() async {
    QuerySnapshot<Map<String, dynamic>> response = await FirebaseFirestore.instance.collection('products').get();

    List<ProductEntity> products = [];
    for(var p in response.docs) {
      products.add(ProductEntity.fromMap(p.data()));
    }

    return products;
  }
}