import 'package:flutter/material.dart';
import 'package:uudi_challenge/ui/components/button_widget.dart';
import 'package:uudi_challenge/ui/pages/cart_page.dart';

class AddedCardDialog extends StatelessWidget {

  const AddedCardDialog({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text(
          "Produto adicionado ao carrinho",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.grey[800],
            fontSize: 22 
          )
        ),
        titlePadding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ButtonWidget(
                  label: "Ir para o carrinho",
                  outline: true,
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartPage())
                  )
                ),
                ButtonWidget(
                  label: "Continuar comprando",
                  onPressed: () => Navigator.pop(context)
                ),
              ],
            ),
          )
        ],
        actionsAlignment: MainAxisAlignment.center,
      ),
    );
            
  }
}