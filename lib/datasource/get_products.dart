import 'package:cloud_firestore/cloud_firestore.dart';

class GetProducts  {
  static void get() async {
    QuerySnapshot<Map<String, dynamic>> response = await FirebaseFirestore.instance.collection('products').get();

    print(response.docs[1].data());
  }
}