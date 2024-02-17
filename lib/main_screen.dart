import 'package:ecommerce_shop/cart.dart';
import 'package:ecommerce_shop/product_list_page.dart';
import 'package:ecommerce_shop/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });
  State<MainScreen> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  final pages = [const ProductPage(), const Cart()];
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
      ],
      builder: (context, child) => MaterialApp(
        theme: ThemeData.dark().copyWith(
          useMaterial3: true,
        ),
        home: Scaffold(
          body: pages[currentPageIndex],
          bottomNavigationBar: NavigationBar(
            selectedIndex: currentPageIndex,
            onDestinationSelected: (value) {
              // print("This is tap value : $value");
              setState(() {
                currentPageIndex = value;
              });
            },
            destinations: [
              const NavigationDestination(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: "Home"),
              NavigationDestination(
                icon: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: const Icon(
                        Icons.shopping_cart,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            context
                                .watch<CartProvider>()
                                .cart
                                .length
                                .toString(),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                label: "Add to Cart",
              ),
            ],
          ), // Text("Hello")),
        ),
      ),
    );
  }
}
