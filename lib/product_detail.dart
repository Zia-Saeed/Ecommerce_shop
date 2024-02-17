// import 'package:ecommerce_shop/product_list_page.dart';
import 'package:ecommerce_shop/provider/cart_provider.dart';
import 'package:ecommerce_shop/shoes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductView extends StatefulWidget {
  const ProductView({
    super.key,
    required this.product,
  });
  final Shoes product;

  @override
  State<ProductView> createState() {
    return _ProductViewState();
  }
}

class _ProductViewState extends State<ProductView> {
  int sizeSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: Container(
        margin: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              widget.product.title,
              style: const TextStyle(fontSize: 25),
            ),
            Hero(
              tag: "product-${widget.product.id}",
              child: Image.asset(
                widget.product.imageUrl,
                fit: BoxFit.cover,
                height: 500,
                width: double.infinity,
              ),
            ),
            Text(
              "\$${widget.product.price.toString()}",
              style: const TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 35,
              child: Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.product.size.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 7,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            sizeSelected = index;
                          });
                        },
                        child: Chip(
                          backgroundColor: sizeSelected == index
                              ? const Color.fromARGB(255, 56, 109, 104)
                              : const Color.fromARGB(255, 103, 103, 103),
                          label: Text(
                            widget.product.size[index],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  widget.product.size = [widget.product.size[sizeSelected]];
                  context.read<CartProvider>().addProduct(widget.product);
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.shopping_cart_outlined),
                label: const Text("Add to Cart"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
