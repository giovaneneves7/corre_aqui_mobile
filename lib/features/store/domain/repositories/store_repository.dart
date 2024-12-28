import 'package:corre_aqui/api/supabase_api_client.dart';
import 'package:corre_aqui/features/store/domain/models/store.dart';
import 'package:corre_aqui/features/store/domain/repositories/store_repository_interface.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StoreRepository implements StoreRepositoryInterface{

	final SupabaseApiClient apiClient;

	StoreRepository({required this.apiClient});

	@Override
	Future<List<Store>> getList() async {

		try{
		
			final data = await apiClient.getData('stores');

			return data.map((store) {
		        
		    	return Store(
		          store['cnpj'] as String,
		          store['name'] as String,
		          store['image_url'] as String,
		        );

		     }).toList();

		} catch(e) {

			throw Exception('Erro ao buscar lista de lojas: $e');

		}

	}

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
  	Future update(Map<String, dynamic> body, int? id) {
    	throw UnimplementedError();
  	}
	  
}

