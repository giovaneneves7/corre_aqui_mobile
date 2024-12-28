import 'package:corre_aqui/api/supabase_api_client.dart';
import 'package:corre_aqui/features/category/domain/repositories/category_repository_interface.dart';

/**
* @author Giovane Neves
* @since v0.0.1
*/
class CategoryRepository implements CategoryRepositoryInterface{
	
	final SupabaseApiClient apiClient;

	CategoryRepository({required this.apiClient});

  	@override
  	Future add(value) {
    	throw UnimplementedError();
  	}

  	@override
  	Future delete(int? id) {
    	throw UnimplementedError();
  	}

  	@override
  	Future get(String? id) {
    	throw UnimplementedError();
  	}

  	@override
  	Future getList() {
    	throw UnimplementedError();
  	}

  	@override
  	Future update(Map<String, dynamic> body, int? id) {
    	throw UnimplementedError();
  	}
	
}