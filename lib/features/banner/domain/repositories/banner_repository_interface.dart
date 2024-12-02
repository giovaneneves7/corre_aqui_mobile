imort 'package:corre_aqui/api/api_client.dart';
import 'package:corre_aqui/interfaces/repository_interface.dart';

/**
* @author Giovane Neves
* @since v0.0.1
*/
abstract class BannerRepositoryInterface implements RepositoryInterface {
	
	@override
	Future getList();

}