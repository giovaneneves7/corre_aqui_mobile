import 'package:flutter/material.dart';

/**
 * Widget 'Últimas Ofertas'.
 * @author Giovane Neves
 * @since v0.0.1
 */
class FreshOffersWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> offers = [
      {
        "title": "Kit Barbeador",
        "price": "R\$9,89",
        "image":
            "https://via.placeholder.com/150/FFCC00/000000",
      },
      {
        "title": "Camiseta Unissex",
        "price": "R\$39,99",
        "image":
            "https://via.placeholder.com/150/00CCFF/000000",
      },
      {
        "title": "Perfume Masculino",
        "price": "R\$24,90",
        "image":
            "https://via.placeholder.com/150/FF6666/000000",
      },
      {
        "title": "Fone EarCuffs",
        "price": "R\$22,88",
        "image":
            "https://via.placeholder.com/150/99CC33/000000",
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Últimas Ofertas",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextButton(
                onPressed: () {
                  // Lógica ao clicar em 'Ver mais'
                },
                child: Text("Ver mais"),
              ),
            ],
          ),
        ),
        GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: offers.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 2 / 3,
          ),
          itemBuilder: (context, index) {
            final offer = offers[index];
            return GestureDetector(
              onTap: () {
                // Lógica ao clicar na oferta
              },
              child: Card(
                elevation: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.grey[300],
                        child: Image.network(
                          offer['image'],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) => Icon(
                            Icons.broken_image,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        offer['title'],
                        style: Theme.of(context).textTheme.bodyMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        offer['price'],
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
