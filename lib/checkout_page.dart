import 'package:ecommerce_shop/order_confirmation_page.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _formkey = GlobalKey<FormState>();

  String? _selectedCity;
  List<String> cities = [
    "Multan",
    "Lahore",
    "Karachi",
    "Islamabad",
    "Peshawar"
  ];
  final TextEditingController _name = TextEditingController();
  final TextEditingController _mobileNumber = TextEditingController();
  final TextEditingController _address = TextEditingController();

  void _placeOrder() {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();
      print(_name.text);
      print(_mobileNumber.text);
      print(_address.text);
      print(_selectedCity);
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => OrderConfirm(
                name: _name.text,
                address: _address.text,
                city: _selectedCity!,
                mobile: _mobileNumber.text)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _name,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Enter your name",
                    alignLabelWithHint: true,
                    prefixIcon: Icon(Icons.person),
                    labelText: "Full name",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    floatingLabelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                TextFormField(
                  controller: _mobileNumber,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your mobile number";
                    }
                    if (value.length < 11 || value.length > 11) {
                      return "Invalid Mobile Number";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Enter your mobile number",
                    alignLabelWithHint: true,
                    prefixIcon: Icon(Icons.phone_android),
                    labelText: "Mobile Number",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    floatingLabelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                TextFormField(
                  controller: _address,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your address";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Address",
                    alignLabelWithHint: true,
                    icon: Icon(
                      Icons.navigation,
                    ),
                    // prefixIcon: Icon(
                    //   Icons.navigation,
                    // ),
                    labelText: "House No./Building No., Street, Area",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    floatingLabelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 36,
                  ),
                  child: const Text(
                    "Location",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.location_pin),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: DropdownButtonFormField(
                        validator: (value) =>
                            value == null ? "Please select city" : null,
                        value: _selectedCity,
                        isExpanded: true,
                        hint: const Text("Select City"),
                        items: cities
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (newValue) {
                          setState(
                            () {
                              _selectedCity = newValue;
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                // Container(
                //   margin: const EdgeInsets.only(left: 38),
                //   child: const Divider(),
                // ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: _placeOrder,
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black87,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      minimumSize: const Size(double.infinity, 60)),
                  child: const Text("Place Order"),
                ),
                // const Text("Paymeny Options")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
