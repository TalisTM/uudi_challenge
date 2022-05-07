import 'package:flutter/material.dart';
import 'package:uudi_challenge/entities/product_entity.dart';
import 'package:uudi_challenge/ui/components/added_cart_dialog.dart';
import 'package:uudi_challenge/ui/components/button_widget.dart';

class CardProduct extends StatelessWidget {
  final ProductEntity product;
  const CardProduct(this.product, { Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      child: InkWell(
        onTap: () {},
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w400,
                              fontSize: 22
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
                      ButtonWidget(
                        label: "Comprar",
                        onPressed: () {
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
        )
      ),
    );
  }
}