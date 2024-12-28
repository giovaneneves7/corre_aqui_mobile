import 'package:flutter/material.dart';

class OfferMapButton extends StatelessWidget{


	@override
	Widget build(BuildContext context){

		return FloatingActionButton(
        	onPressed: () {
          		Get.toNamed(RouteHelper.getOfferMapScreen());
        	},
        	backgroundColor: Colors.red,
        	child: const Icon(
          		Icons.location_pin, 
          		size: 32,
          		color: Colors.white
          	),
      	),

	}
}