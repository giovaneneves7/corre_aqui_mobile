import 'package:corre_aqui/common/widgets/cards_template/event_card_template.dart';
import 'package:corre_aqui/features/event/controllers/event_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/**
* @author Giovane Neves
* @since v0.0.1
*/
class NextEventsWidget extends StatelessWidget{

	@override
	Widget build(BuildContext context){

		return GetBuilder<EventController>(
			(controller){

				if (controller.categoryList.isEmpty) {
          			return const Center(
            			child: CircularProgressIndicator(),
          			);
        		} else {
        			return Column(

        				children: [
        					Text("Próximos Eventos", style: Theme.of(context).textTheme.titleLarge),
              				SizedBox(height: 10),
        					controller.eventList.map((event){
        						return GestureDetector(
                    				onTap: () {},
                    				child: EventCardTemplate(event: event),
                  				);       	
                  			}).toList(),
        				],
        			);
        		}
				
			}
		);

	}

}