import 'package:corre_aqui/interfaces/repository_interface.dart';

/**
* @author Giovane Neves
* @since v0.0.1
*/
abstract class EventRepositoryInterface implements ReositoryInterface{

	@override
	Future getList();

}