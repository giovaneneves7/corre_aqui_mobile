import 'package:corre_aqui/common/widgets/cards_template/store_card_template.dart';
import 'package:corre_aqui/features/store/controllers/store_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/**
 * @author Giovane Neves
 * @since v0.0.1
 */
class NewStoresSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreController>(
      builder: (controller) {
        if (controller.stores.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(), 
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Novas Lojas",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal, // Rola horizontalmente
                child: Row(
                  children: controller.stores.map((store) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0), // Espaçamento entre os cards
                      child: StoreCardTemplate(store: store),
                    );
                  }).toList(),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
