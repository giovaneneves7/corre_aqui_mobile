import 'package:corre_aqui/features/offer/controllers/offer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/**
 * Widget 'Últimas Ofertas'.
 * @author Giovane Neves
 * @since v0.0.1
 */
class FreshOffersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OfferController>(
      builder: (controller) {
        if (controller.offerList.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
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
                      onPressed: () {},
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
                itemCount: controller.offerList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 2 / 3,
                ),
                itemBuilder: (context, index) {
                  final offer = controller.offerList[index];
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
                                offer.imageUrl, 
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
                              offer.name, 
                              style: Theme.of(context).textTheme.bodyMedium,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              offer.offerPrice, 
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
      },
    );
  }
}
