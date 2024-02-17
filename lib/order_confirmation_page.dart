import 'package:ecommerce_shop/main_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class OrderConfirm extends StatefulWidget {
  const OrderConfirm(
      {super.key,
      required this.name,
      required this.address,
      required this.city,
      required this.mobile});
  final String name;
  final String mobile;
  final String address;
  final String city;
  @override
  State<StatefulWidget> createState() {
    return _StateOrderConfirm();
  }
}

class _StateOrderConfirm extends State<OrderConfirm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Confirm Order",
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 100,
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  "Congratulations",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 28,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Your order has been place and will be delivered to your city: ${widget.city} at the address : ${widget.address} within 3 to 5 days.",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const MainScreen(),
                        ),
                        (Route<dynamic> route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black87,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  child: const Text("Go to Home Page"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
