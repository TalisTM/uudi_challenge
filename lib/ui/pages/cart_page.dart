import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:uudi_challenge/stores/cart_store.dart';
import 'package:uudi_challenge/ui/components/card_item_cart.dart';
import 'package:uudi_challenge/ui/components/dialog_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({ Key? key }) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  final CartStore cartStore = GetIt.I.get<CartStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carrinho"),
        centerTitle: true,
        actions: [
          Observer(
            builder: (context) {
              return IconButton(
                color: Colors.white,
                icon: const Icon(Icons.delete_outline),
                onPressed: cartStore.itens.isNotEmpty
                  ? () {
                      showDialog(
                        context: context,
                        builder: (_) => DialogWidget(
                          title: "Limpar carrinho",
                          subTitle: "Você tem certeza que deseja limpar seu carrinho?",
                          primarylabel: "Limpar",
                          primaryFunc: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            cartStore.clear();
                          },
                          secundaryLabel: "Cancelar",
                          secundaryFunc: () => Navigator.pop(context),
                        )
                      );
                    }
                  : null
              );
            }
          )
        ],
      ),
      body: Observer(
        builder: (context) {
          return ListView.builder(
            itemCount: cartStore.itens.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (_, index) {
              return CardItemCart(cartStore.itens[index]);
            }
          );
        }
      )
    );
  }
}