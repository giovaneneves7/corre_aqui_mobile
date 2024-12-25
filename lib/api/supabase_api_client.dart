import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseApiClient {

  	final SupabaseClient client;
  	final String authToken;
	 final SharedPreferences sharedPreferences;

  	SupabaseApiClient({required this.client, required this.authToken, required this.sharedReferences});

  	Map<String, String> _getHeaders() {
    	return {
      	'Authorization': 'Bearer $authToken',
      	'Content-Type': 'application/json',
    	};
  	}

  Future<List<Map<String, dynamic>>> getData(String table, {Map<String, dynamic>? filters}) async {
    
    try {
      final query = client.from(table).select();
      filters?.forEach((key, value) {
        query.eq(key, value);
      });

      final response = await query.execute();
      if (response.error != null) {
        throw Exception('Erro: ${response.error!.message}');
      }
      return response.data as List<Map<String, dynamic>>;
    } catch (e) {
      rethrow;
    }
  }

  // Método genérico para inserir dados
  Future<void> postData(String table, Map<String, dynamic> body) async {
    try {
      final response = await client.from(table).insert(body).execute();
      if (response.error != null) {
        throw Exception('Erro: ${response.error!.message}');
      }
    } catch (e) {
      rethrow;
    }
  }

  // Método genérico para atualizar dados
  Future<void> putData(String table, Map<String, dynamic> body, Map<String, dynamic> filters) async {
    try {
      final query = client.from(table).update(body);
      filters.forEach((key, value) {
        query.eq(key, value);
      });

      final response = await query.execute();
      if (response.error != null) {
        throw Exception('Erro: ${response.error!.message}');
      }
    } catch (e) {
      rethrow;
    }
  }

  // Método genérico para excluir dados
  Future<void> deleteData(String table, Map<String, dynamic> filters) async {
    try {
      final query = client.from(table).delete();
      filters.forEach((key, value) {
        query.eq(key, value);
      });

      final response = await query.execute();
      if (response.error != null) {
        throw Exception('Erro: ${response.error!.message}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
