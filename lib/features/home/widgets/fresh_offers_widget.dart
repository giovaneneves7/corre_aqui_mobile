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
        "title": "Lacta Chocolate ao Leite",
        "price": "R\$9,89",
        "image": "https://casaevideonewio.vtexassets.com/arquivos/ids/395494/Bar--Choc-Lacta-Ao-Leite-165g-1670522.jpg?v=637690399418430000",
      },
      {
        "title": "Whey Protein Growth",
        "price": "R\$39,99",
        "image": "https://www.gsuplementos.com.br/upload/produto/imagem/top-whey-protein-concentrado-1kg-growth-supplements-19.webp",
      },
      {
        "title": "O Boticário Malbec",
        "price": "R\$24,90",
        "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9CVIySdQrReB2rJL4wdoy9dUGQLZ6Ua9Kpw&s",
      },
      {
        "title": "Ração para Cachorro Pedigree",
        "price": "R\$22,88",
        "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTq7cfQZ_8AOtOdUxDQnRB3aq8PGjazRMqscQ&s",
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Últimas Ofertas",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextButton(
                onPressed: () {
                },
                child: Text(
                  "Ver mais",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ),
        GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
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
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(8),
                        ),
                        child: Image.network(
                          offer['image'],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) =>
                              Icon(Icons.broken_image, color: Colors.grey),
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
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: Colors.red, fontWeight: FontWeight.bold),
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
