import 'package:flutter/material.dart';

class HomeOfferScreen extends StatefulWidget {
  const HomeOfferScreen({Key? key}) : super(key: key);

  @override
  _HomeOfferScreenState createState() => _HomeOfferScreenState();
}

class _HomeOfferScreenState extends State<HomeOfferScreen> {
  // Sample data for products
  final List<Product> _products = [
    Product('Batata Chips', 'assets/images/chips.jpg', 20),
    Product('Refrigerante', 'assets/images/soda.jpg', 15),
    Product('Camisa', 'assets/images/shirt.jpg', 30),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Pesquise Qualquer Coisa...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2.0,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                isDense: true,
              ),
            ),
            SizedBox(height: 20),

            // Offer Banner
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage('assets/images/promo.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.center,
            ),
            SizedBox(height: 20),

            // Categories section
            Text("Categorias", style: Theme.of(context).textTheme.headline6),
            SizedBox(height: 10),
            Container(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCategoryCard(Icons.restaurant, 'Alimentos'),
                  SizedBox(width: 10),
                  // ... other categories
                ],
              ),
            ),
            SizedBox(height: 20),

            // Offer Sections
            Text("Ofertas", style: Theme.of(context).textTheme.headline6),
            SizedBox(height: 10),

            // Loop through products and build offer cards
            Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: _products.map((product) => _buildOfferCard(product)).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(IconData icon, String title) {
    // ... (implementation for category card)
  }

  Widget _buildOfferCard(Product product) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 20,
      height: MediaQuery.of(context).size.width / 2 - 20,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(product.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0.0,
            left: 0.0,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${product.discount}% OFF',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Product {
  final String name;
  final String imageUrl;
  final int discount;

  Product(this.name, this.imageUrl, this.discount);
}