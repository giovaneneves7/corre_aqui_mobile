import 'package:corre_aqui/features/offer/domain/models/offer.dart';
import 'package:flutter/material.dart';

/**
 * Widget 'Últimas Ofertas'.
 * @author Giovane Neves
 * @since v0.0.1
 */
class OfferCardTemplate extends StatelessWidget{

	final Offer offer;

	OfferCardTemplate({required this.offer});

	@override
	Widget build(BuildContext context){

		return Container(
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
                            '${offer.offerPrice}', 
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                            ),
                        ),
                    ),
                ],
            ),
        );
	}

}