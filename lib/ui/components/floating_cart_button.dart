import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:uudi_challenge/stores/cart_store.dart';
import 'package:uudi_challenge/ui/pages/cart_page.dart';

class FloatingCartButton extends StatelessWidget {
  FloatingCartButton({ Key? key }) : super(key: key);

  final CartStore cartStore = GetIt.I.get<CartStore>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FloatingActionButton(
          backgroundColor: const Color(0xFF00bee0),
          child: const Icon(Icons.shopping_cart_outlined), 
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CartPage())
          )
        ),
        Positioned(
          right: 0,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.amber[800],
              shape: BoxShape.circle
            ),
            height: 23,
            width: 23,
            child: Observer(
              builder: (context) {
                return Text(
                  cartStore.quantityItens > 100
                    ? "99" : cartStore.quantityItens.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                  )
                );
              }
            )
          ),
        )
      ],
    );
  }
}