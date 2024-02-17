import 'package:ecommerce_shop/product_detail.dart';
import 'package:ecommerce_shop/shoes.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});
  @override
  State<ProductPage> createState() {
    return _ProductPage();
  }
}

class _ProductPage extends State<ProductPage> {
  final List<String> brands = [
    "All",
    "Nike",
    "Addidas",
    "Puma",
    "Reebok",
    "Fila",
    "Bata"
  ];
  int selectedCompanyIndex = 0;

  final List<Shoes> products = [
    Shoes(
      brandName: "Nike",
      price: 100,
      size: ["41", "42", "43", "44"],
      imageUrl: "assets/shoes-images/shoe2.jpg",
      title: "Sports Shoes",
    ),
    Shoes(
      brandName: "Nike",
      price: 70,
      size: ["41", "42", "43", "44"],
      imageUrl: "assets/shoes-images/shoe3.jpg",
      title: "Sports Shoes",
    ),
    Shoes(
      brandName: "Nike",
      price: 60,
      size: ["41", "42", "43", "44"],
      imageUrl: "assets/shoes-images/shoe4.jpg",
      title: "Sports Shoes",
    ),
    Shoes(
      brandName: "Nike",
      price: 80,
      size: ["41", "42", "43", "44"],
      imageUrl: "assets/shoes-images/shoe6.png",
      title: "Sports Shoes",
    ),
    Shoes(
      brandName: "Nike",
      price: 120,
      size: ["41", "42", "43", "44"],
      imageUrl: "assets/shoes-images/shoe7.jpg",
      title: "Sports Shoes",
    ),
    Shoes(
      brandName: "Nike",
      price: 150,
      size: ["41", "42", "43", "44"],
      imageUrl: "assets/shoes-images/shoe9.jpg",
      title: "Sports Shoes",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shop Now"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text(
                    "Shoes\nCollection",
                    style: TextStyle(
                      fontSize: 19,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 40,
                child: Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: brands.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(
                          right: 10,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCompanyIndex = index;
                            });
                          },
                          child: Chip(
                            side: const BorderSide(
                              color: Color.fromRGBO(252, 239, 239, 1),
                            ),
                            backgroundColor: selectedCompanyIndex == index
                                ? const Color.fromARGB(255, 56, 109, 104)
                                : const Color.fromARGB(255, 103, 103, 103),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            label: Text(
                              brands[index],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  // physics: constNeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.only(bottom: 15),
                      elevation: 4,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            child: Text(
                              products[index].title,
                              style: const TextStyle(
                                fontSize: 24,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 6,
                            ),
                            child: Text(
                              "\$${products[index].price.toString()}",
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ProductView(
                                      product: products[index],
                                    );
                                  },
                                ),
                              );
                            },
                            child: Hero(
                              tag: "product-${products[index].id}",
                              child: Image.asset(
                                products[index].imageUrl,
                                height: 300,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                // width: double.infinity,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
