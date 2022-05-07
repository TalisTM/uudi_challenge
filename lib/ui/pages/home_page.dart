import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:uudi_challenge/stores/home_store.dart';
import 'package:uudi_challenge/ui/components/card_product.dart';
import 'package:uudi_challenge/ui/components/floating_cart_button.dart';
import 'package:uudi_challenge/ui/components/no_item.dart';

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
        title: Image.asset(
          "assets/images/logo.png",
          height: 40,
          fit: BoxFit.cover,
        ),
        centerTitle: true,
      ),
      body: Observer(
        builder: (context) {
          if(homeStore.products.isNotEmpty) {
            return ListView.builder(
              itemCount: homeStore.products.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, index) {
                return CardProduct(homeStore.products[index]);
              }
            );
          } else {
            return const NoItem(
              title: "Nada por aqui...",
              subtitle: "Não exitem produtos para serem mostrado"
            );
          }
        }
      ),
      floatingActionButton: FloatingCartButton(),
    );
  }
}