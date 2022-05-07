import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:uudi_challenge/datasource/get_products.dart';
import 'package:uudi_challenge/stores/home_store.dart';
import 'package:uudi_challenge/ui/components/card_product.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final HomeStore homeStore = GetIt.I.get<HomeStore>();

  @override
  void initState() {
    super.initState();

    homeStore.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UUID"),
        centerTitle: true,
      ),
      body: Observer(
        builder: (context) {
          return ListView.builder(
            itemCount: homeStore.products.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (_, index) {
              return CardProduct(homeStore.products[index]);
            }
          );
        }
      )
    );
  }
}