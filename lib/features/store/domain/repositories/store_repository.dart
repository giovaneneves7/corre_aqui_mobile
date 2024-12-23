import 'package:corre_aqui/features/store/models/store.dart';
import 'package:corre_aqui/features/store/domain/repositories/store_repository_interface.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StoreRepository implements StoreRepositoryInterface{

	final SupabaseApiClient apiClient;

	StoreRepository({required this.apiClient});

	@Override
	Future<List<Store>> getList() async {

	    if (response.error != null) {
	      throw Exception('Erro ao buscar dados: ${response.error!.message}');
	    }

	    final data = response.data as List<dynamic>;
	    return data.map((store) {
	      return Store(
	        store['cnpj'] as String,
	        store['name'] as String,
	        store['image_url'] as String,
	      );
	    }).toList();
	  }
	  
	}

}