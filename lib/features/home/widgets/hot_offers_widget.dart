import 'package:corre_aqui/common/widgets/cards_template/offer_card_template.dart';
import 'package:corre_aqui/features/offer/controllers/offer_controller.dart';
import 'package:corre_aqui/helper/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/**
* @author Giovane Neves
* @since v0.0.1
*/
class HotOffersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OfferController>(
      builder: (offerController) {
        if (offerController.hightDiscountOfferList.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Maiores Descontos",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Ver Mais",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: offerController.hightDiscountOfferList.length,
                itemBuilder: (context, index) {
                  final offer = offerController.hightDiscountOfferList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                      width: 180,
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteHelper.getOfferDetailsScreen(offerId: offer.id));
                        },
                        child: OfferCardTemplate(offer: offer, isFromHome: true),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
