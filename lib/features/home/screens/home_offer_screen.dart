import 'package:corre_aqui/features/banner/controllers/banner_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeOfferScreen extends StatelessWidget {
  const HomeOfferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título e botão de configurações
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Corre Aqui!",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.settings),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Campo de busca
            TextField(
              decoration: InputDecoration(
                hintText: 'O que você procura?',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Seção de categorias
            const Text(
              "Categorias",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCategoryCard(context, Icons.restaurant, "Academia"),
                _buildCategoryCard(context, Icons.shopping_bag, "Roupas"),
                _buildCategoryCard(context, Icons.local_grocery_store, "Supermercado"),
                _buildCategoryCard(context, Icons.fitness_center, "Fitness"),
              ],
            ),
            const SizedBox(height: 24),

            // Banner promocional
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  image: NetworkImage('https://via.placeholder.com/400x150'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Seção de parceiros
            const Text(
              "Parceiros",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildPartnerCard(context, 'Atacadão', 'https://via.placeholder.com/100'),
                _buildPartnerCard(context, 'Farmácia Super Popular', 'https://via.placeholder.com/100'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, IconData icon, String title) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }

  Widget _buildPartnerCard(BuildContext context, String name, String imageUrl) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }
}
