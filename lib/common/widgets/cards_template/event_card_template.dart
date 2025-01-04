import 'package:corre_aqui/features/event/domain/models/event.dart';
import 'package:flutter/material.dart';

/**
* @author Giovane Neves
* @since v0.0.1
*/
class EventCardTemplate extends StatelessWidget{

	final Event event;

	EventCardTemplate({required this.event});

	@override
	Widget build(BuildContext context){

		return Container(
      		decoration: BoxDecoration(
        		color: Theme.of(context).colorScheme.surface,
        		borderRadius: BorderRadius.circular(8),
      		),
      		child: Padding(
	        	padding: const EdgeInsets.all(8.0),
	        	child: Row(
	          		children: [
	            		ClipRRect(
	              			borderRadius: BorderRadius.circular(8),
	              			child: DecorationImage(
		              			image: NetworkImage(event.imageUrl),
		              			fit: BoxFit.cover,
		            		),
	            		),
	            		SizedBox(width: 10),
	            		Column(
	              			crossAxisAlignment: CrossAxisAlignment.start,
	              			children: [
		                		Text(
		                  			event.name,
		                  			style: Theme.of(context).textTheme.bodyLarge,
		                		),
		                		SizedBox(height: 5),
	                			Row(
	                  				children: [
	                    				Icon(Icons.access_time, size: 16),
	                    				SizedBox(width: 5),
	                    				Text("22:00"),
	                    				SizedBox(width: 10),
	                    				Icon(Icons.location_pin, size: 16),
	                    				SizedBox(width: 5),
	                    				Text(event.location),
	                  				],
	                			),
	              			],
	            		),
	          		],
	        	),
      		),
    	); 
	}
}