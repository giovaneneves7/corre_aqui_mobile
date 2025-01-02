import 'package:corre_aqui/features/event/domain/models/event.dart';
import 'package:corre_aqui/features/event/domain/repositories/event_repository_interface.dart';

/**
* @author Giovane Neves
* @since v0.0.1
*/
class EventService implements EventServiceInterface{

	final EventServiceInterface eventServiceInterface;

	EventService({required this.eventServiceInterface});

	@override
	Future<List<Event>> getEventList() async{

		return await eventServiceInterface.getList();

	}

}