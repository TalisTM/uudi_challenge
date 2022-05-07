import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uudi_challenge/entities/cart_item_entity.dart';
import 'package:uudi_challenge/entities/product_entity.dart';
import 'package:uudi_challenge/stores/cart_store.dart';
import 'package:uudi_challenge/ui/components/added_cart_dialog.dart';
import 'package:uudi_challenge/ui/components/button_widget.dart';

class CardProduct extends StatelessWidget {
  final ProductEntity product;
  CardProduct(this.product, { Key? key}) : super(key: key);

  final CartStore cartStore = GetIt.I.get<CartStore>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Image.network(
                product.image,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Card(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w400,
                              overflow: TextOverflow.visible,
                              fontSize: 20
                            )
                          ),
                          Text(
                            "R\$ ${product.price.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF00bee0),
                              fontSize: 18
                            )
                          )
                        ],
                      ),
                    ),
                    ButtonWidget(
                      label: "Comprar",
                      onPressed: () {
                        CardItemEntity item = CardItemEntity(product: product, quantity: 1);
                        
                        //CASO O PRODUTO JA ESTEJA NO CARRINHO: ADICIONA A QUANTIDADE DAQUELE PRODUTO
                        //DO CONTRÁRIO, ADICIONA O PRODUTO NO CARRINHO
                        bool hasItem = false;
                        for(CardItemEntity i in cartStore.itens) {
                          if(i.product.id == item.product.id) {
                            cartStore.addQuantity(item.product.id);
                            hasItem = true;
                            break;
                          }
                        }
                        
                        if(!hasItem) {
                          cartStore.addItem(item);
                        }

                        showDialog(
                          context: context,
                          builder: (_) => const AddedCardDialog()
                        );
                      },
                    )
                  ],
                ),
              )
            ),
          ),
        ],
      ),
    );
  }
}