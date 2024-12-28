import 'package:corre_aqui/features/home/widgets/banner_carousel.dart';
import 'package:corre_aqui/features/home/widgets/category_list.dart';
import 'package:corre_aqui/features/home/widgets/components/offer_map_button.dart';
import 'package:corre_aqui/features/home/widgets/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/**
* @author Giovane Neves
* @since v0.0.1
*/
class HomeOfferScreen extends StatelessWidget {
  const HomeOfferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Buscar no",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        Text(
                          "Corre Aqui!",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: Colors.red),
                        const SizedBox(width: 4),
                        const Text(
                          "Irecê, BA",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(width: 16),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_border),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Search bar
                Searchbar(),
                const SizedBox(height: 16),

                // Promotional Banner
                BannerCarousel(),
                const SizedBox(height: 16),

                // Categories
                CategoryList(),
                const SizedBox(height: 16),

                // Parceiros
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Parceiros",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Ver Todos"),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Lista de parceiros
                Row(
                  children: [
                    _buildPartnerCard("Atacadão", "https://via.placeholder.com/100"),
                    const SizedBox(width: 16),
                    _buildPartnerCard("Farmácia Super Popular", "https://via.placeholder.com/100"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: OfferMapButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0, 
        child: SizedBox(
          height: 60, 
          child: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
            ],
            currentIndex: 0,
            onTap: (index) {},
          ),
        ),
      ),
    );
  }

  Widget _buildPartnerCard(String name, String imageUrl) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
