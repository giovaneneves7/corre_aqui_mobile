import 'package:corre_aqui/features/category/controllers/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/**
* @author Giovane Neves
* @since v0.0.1
*/
class CategoryList extends StatelessWidget{


	@override
	Widget build(BuildContext context){

		return GetBuilder<CategoryController>(
      		builder: (controller) {
        		if (controller.categoryList.isEmpty) {
          		return const Center(
            		child: CircularProgressIndicator(), 
          		);
	        	} else {
	          		return SingleChildScrollView(
		            	scrollDirection: Axis.horizontal, 
		            	child: Row(
		              		children: controller.categoryList.map((category) {
		               			return Padding(
		                  			padding: const EdgeInsets.only(right: 16.0), // Espaçamento entre os cards
		                  			child: Column(
		                    			children: [
		                      				Container(
		                        				width: 60,
		                        				height: 60,
		                        				decoration: BoxDecoration(
		                          					shape: BoxShape.circle,
		                          					image: DecorationImage(
		                            					image: NetworkImage(category.imageUrl),
		                            					fit: BoxFit.cover,
		                          					),
		                        				),
		                      				),
		                      				const SizedBox(height: 8),
			                      			Text(
			                        			category.name,
			                        			style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
			                      			),
		                    			],
		                  			),
		                		);
		              		}).toList(),
		            	),
	          		);
	        	}
      		},
    	);

	}

}