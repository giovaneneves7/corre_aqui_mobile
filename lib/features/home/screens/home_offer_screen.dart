import 'package:corre_aqui/features/banner/controllers/banner_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeOfferScreen extends StatefulWidget {
  const HomeOfferScreen({Key? key}) : super(key: key);

  @override
  _HomeOfferScreenState createState() => _HomeOfferScreenState();
}

class _HomeOfferScreenState extends State<HomeOfferScreen> {
  
  late final BannerController bannerController;
  
  // Sample data for products
  final List<Product> _products = [
    Product('Batata Chips', 'assets/images/chips.jpg', 20),
    Product('Batata Chips', 'assets/images/chips.jpg', 20),
    Product('Batata Chips', 'assets/images/chips.jpg', 20),
    Product('Batata Chips', 'assets/images/chips.jpg', 20),
  ];

    final List<Product> _popularProducts = [
    Product('Batata Chips', 'assets/images/chips.jpg', 20),
    Product('Batata Chips', 'assets/images/chips.jpg', 20),
    Product('Batata Chips', 'assets/images/chips.jpg', 20),
    Product('Batata Chips', 'assets/images/chips.jpg', 20),
  ];

  @override
  void initState() {

    super.initState();
    bannerController = Get.find<BannerController>(); 
    bannerController.getBannerList(); 
  
  }


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
                prefixIcon: const Icon(Icons.search),
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
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                isDense: true,
              ),
            ),
            const SizedBox(height: 20),

            // Offer Banner
            Obx(() {
              final banners = bannerController.bannerList;
              if (banners == null || banners.isEmpty) {
                return const SizedBox(
                  height: 150,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              final firstBanner = banners.first;
              return Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(firstBanner.imageUrl!),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.center,
              );
            }),

            const SizedBox(height: 20),

            // Categories section
            Text("Categorias", style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 10),
            Container(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCategoryCard(Icons.restaurant, 'Alimentos'),
                  SizedBox(width: 10),
                  _buildCategoryCard(Icons.devices_other, 'Equipamentos'),
                  SizedBox(width: 10),
                  _buildCategoryCard(Icons.checkroom, 'Roupas'),
                  SizedBox(width: 10),
                  _buildCategoryCard(Icons.chair, 'Móveis'),
                  SizedBox(width: 10),
                  _buildCategoryCard(Icons.fitness_center, 'Academia'),

                  SizedBox(width: 10),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Offer Sections
            Text("Ofertas", style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 10),

            Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: _products.map((product) => _buildOfferCard(product)).toList(),
            ),
            SizedBox(height: 10),

            Text("Produtos Populares", style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 10),

            // Loop through popular products and build offer cards
            Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: _popularProducts.map((product) => _buildOfferCard(product)).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(IconData icon, String title) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            size: 30,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        SizedBox(height: 5),
        //Text(title, style: Theme.of(context).textTheme.bodyText1),
      ],
    );
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(  

                        '${product.discount}%',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0, // Increased font size for emphasis
                          fontWeight: FontWeight.bold, // Bold text for highlight
                        ),
                      ),
                      Text(
                        'Preço original', // Placeholder for original price (replace with actual price logic)
                        style: TextStyle(
                          color: Colors.white70, // Faded text for less emphasis
                          fontSize: 10.0,
                          decoration: TextDecoration.lineThrough, // Strikethrough for original price
                        ),
                      ),
                    ],
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