import 'package:ecommerce_shop/checkout_page.dart';
import 'package:ecommerce_shop/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});
  @override
  State<Cart> createState() {
    return _CartState();
  }
}

class _CartState extends State<Cart> {
  double _getCartTotal() {
    double total = 0;
    final products = context.watch<CartProvider>().cart;

    for (final prod in products) {
      total += prod.price;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        actions: context.watch<CartProvider>().cart.isEmpty
            ? []
            : [
                IconButton(
                  onPressed: () {
                    context.read<CartProvider>().removeAllProduct();
                  },
                  icon: const Text("Clear Cart"),
                ),
              ],
      ),
      body: context.watch<CartProvider>().cart.isEmpty
          ? const Center(
              child: Text("No Item in Cart"),
            )
          : Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: ListView.builder(
                      itemCount: context.watch<CartProvider>().cart.length,
                      itemBuilder: (context, index) {
                        final product =
                            context.watch<CartProvider>().cart[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Card(
                            elevation: 3,
                            child: ListTile(
                              title: Text(
                                product.title,
                              ),
                              subtitle: Text(
                                "Size : ${product.size[0]}\n\$${product.price}",
                              ),
                              leading: Image.asset(
                                product.imageUrl,
                                width: 76,
                                fit: BoxFit.cover,
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  context
                                      .read<CartProvider>()
                                      .removeProduct(product);
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Theme.of(context).colorScheme.error,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Total: \$${_getCartTotal()}",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const CheckoutPage(),
                          ));
                        },
                        icon: const Icon(
                          Icons.chevron_right,
                        ),
                        label: const Text(
                          "Proceed to Checkout",
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
