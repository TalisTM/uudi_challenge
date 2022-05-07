import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:uudi_challenge/entities/cart_item_entity.dart';
import 'package:uudi_challenge/stores/cart_store.dart';

class CardItemCart extends StatelessWidget {
  final CardItemEntity item;
  CardItemCart(this.item, { Key? key}) : super(key: key);

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
                item.product.image,
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
                child: Observer(
                  builder: (context) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.product.name,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.w400,
                                  overflow: TextOverflow.visible,
                                  fontSize: 20
                                )
                              ),
                              Text(
                                "R\$ ${item.product.price.toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF00bee0),
                                  fontSize: 18
                                )
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                item.quantity > 1 ? Icons.remove : Icons.delete_outline,
                                color: const Color(0xFF00bee0)
                              ),
                              onPressed: () {
                                if(item.quantity > 1) {
                                  cartStore.removeQuantity(item.product.id);
                                } else if(item.quantity == 1) {
                                  cartStore.removeItem(item);
                                }
                              },
                            ),
                            Text(item.quantity.toString()),
                            IconButton(
                              icon: const Icon(Icons.add, color: Color(0xFF00bee0)),
                               onPressed: () {
                                 if(item.quantity <= 10) {
                                   cartStore.addQuantity(item.product.id);
                                 }
                               },
                            )
                          ],
                        )
                      ],
                    );
                  }
                ),
              )
            ),
          ),
        ],
      ),
    );
  }
}