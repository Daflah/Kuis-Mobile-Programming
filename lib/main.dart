import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Product {
  final String name;
  final String image;
  final String price;

  Product({required this.name, required this.image, required this.price});
}

class MyApp extends StatelessWidget {
  final List<Product> products = [
    Product(name: 'Minyak Kayu Putih', image: 'images/kayuputih.jpg', price: 'Rp 13.300'),
    Product(name: 'Rinso + Molto Rose Fresh Detergen Cair', image: 'images/rinso.jpg', price: 'Rp 60.500'),
    Product(name: 'Counterpain Cool 30gr', image: 'images/counterpainn.jpg', price: 'Rp 37.800'),
    Product(name: 'Minyak Goreng Bimoli', image: 'images/bimoli.jpg', price: 'Rp 60.800'),
    Product(name: 'Indomie Goreng', image: 'images/indomie.jpg', price: 'Rp 5.800'),
    Product(name: 'Lifebouy Bodywash', image: 'images/lifebouy.jpg', price: 'Rp 16.00'),
    Product(name: 'Head and Shoulders 170ml', image: 'images/sampo.jpg', price: 'Rp 25.000'),
    Product(name: 'Sikat Gigi Formula', image: 'images/sikat.jpg', price: 'Rp 15.800'),
    Product(name: 'Beras Merah Premium', image: 'images/beras.jpg', price: 'Rp 80.800'),
    Product(name: 'Esse Change Double', image: 'images/rokok.jpg', price: 'Rp 25.800'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Godrej'),
          backgroundColor: Colors.red,
          actions: [
            IconButton(
              icon: Image.asset('images/search.png'),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset('images/shopping.png'),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Bagian header
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset('images/godrej.png', width: 50, height: 50),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Godrej',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Icon(Icons.people),
                              SizedBox(width: 4),
                              Text('1000 Pengikut'),
                            ],
                          ),
                          Text('Mengikuti'),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Tampilan produk
                for (int i = 0; i < products.length; i += 2)
                  Row(
                    children: [
                      Expanded(
                        child: buildProductCard(context, products[i]),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: i + 1 < products.length
                            ? buildProductCard(context, products[i + 1])
                            : Container(),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildProductCard(BuildContext context, Product product) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(product.image, width: double.infinity, height: 150, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  product.price,
                  style: const TextStyle(fontSize: 14, color: Colors.green),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Aksi saat tombol Beli ditekan
                      },
                      child: const Text('Beli'),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_shopping_cart),
                      onPressed: () {
                        // Aksi saat tombol Tambah ke Keranjang ditekan
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
