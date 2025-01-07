import 'package:corre_aqui/common/return_app_bar.dart';
import 'package:corre_aqui/features/offer/controllers/offer_controller.dart';
import 'package:corre_aqui/features/offer/domain/models/offer.dart';
import 'package:corre_aqui/features/store/controllers/store_controller.dart';
import 'package:corre_aqui/features/store/domain/models/store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/**
* @author Giovane Neves
* @since v0.0.1
*/
class OfferDetailsScreen extends StatefulWidget {

  final int offerId;

  OfferDetailsScreen({
    required this.offerId,
  });

  @override
  State<OfferDetailsScreen> createState() => _OfferDetailsScreenState();
}

class _OfferDetailsScreenState extends State<OfferDetailsScreen> {
  
  late Offer offer;
  late Store store;

  @override
  Widget build(BuildContext context) {

    return GetBuilder<OfferController>(
      builder: (offerController){
                
        offer = offerController.getOfferById(widget.offerId);

        return GetBuilder<StoreController>(
          builder: (storeController){

            store = storeController.getStoreById(offer.storeId);

            return Scaffold(
              appBar: ReturnAppBar(title: "Informações da Oferta"),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          offer.imageUrl,
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      offer.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "\$${offer.offerPrice.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(store.imageUrl),
                          radius: 30,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          store.name,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    const Spacer(),
                    // Botões "Comprar agora" e "Adicionar ao carrinho"
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // Lógica para comprar
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: const Text(
                              "Buy Now",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        ElevatedButton(
                          onPressed: () {
                            // Lógica para adicionar ao carrinho
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[300],
                            padding: const EdgeInsets.all(16),
                            shape: const CircleBorder(),
                          ),
                          child: const Icon(
                            Icons.shopping_cart,
                            color: Colors.pink,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }
        );

      }
    );
  }
}