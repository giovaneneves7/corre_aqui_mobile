import 'package:corre_aqui/common/widgets/return_app_bar';
import 'package:corre_aqui/features/store/controllers/store_controller.dart';
import 'package:corre_aqui/features/store/domain/models/store.dart';
import 'package:corre_aqui/features/store/widgets/store_banner_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/**
* @author Giovane Neves
* @since v0.0.1
*/
class StoreDetailsScreen extends StatefulWidget {
  final int storeId;

  StoreDetailsScreen({required this.storeId});

  @override
  State<StoreDetailsScreen> createState() => _StoreDetailsScreenState();
}

class _StoreDetailsScreenState extends State<StoreDetailsScreen> {
  
  late Store store;

  @override
  Widget build(BuildContext context) {

    return GetBuilder<StoreController>(
      builder: (controller){
        
        store = controller.getStoreById(widet.storeId);

        if (store == null) {
              return SizedBox.shrink();
        }

        return Scaffold(
          appBar: ReturnAppBar(),
          extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StoreBannerWidget(store: store),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        store.name,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Promotions and Offers
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: const Text(
                    'Promoções e Ofertas',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 100, 
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      PromotionCard(
                        imageUrl: 'https://via.placeholder.com/80x80',
                        title: 'Produto 1',
                        price: 'R\$ 25,00',
                      ),
                      PromotionCard(
                        imageUrl: 'https://via.placeholder.com/80x80',
                        title: 'Produto 2',
                        price: 'R\$ 30,00',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // "Ver Rotas" Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () {},
                    child: const Center(
                      child: Text(
                        'Ver Rotas',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}

// Componente para as promoções
class PromotionCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;

  const PromotionCard({
    required this.imageUrl,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(fontSize: 14),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            price,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
