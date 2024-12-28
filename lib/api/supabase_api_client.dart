import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseApiClient {
  final SupabaseClient client;
  final String authToken;
  final SharedPreferences sharedPreferences;

  SupabaseApiClient({
    required this.client,
    required this.authToken,
    required this.sharedPreferences,
  });

  Map<String, String> _getHeaders() {
    return {
      'Authorization': 'Bearer $authToken',
      'Content-Type': 'application/json',
    };
  }

  // Método genérico para buscar dados
  Future<List<Map<String, dynamic>>> getData(String table, {Map<String, dynamic>? filters}) async {
    try {
      var query = client.from(table).select();
      filters?.forEach((key, value) {
        query = query.eq(key, value);
      });

      final response = await query; // Supabase retorna diretamente a resposta
      if (response is PostgrestResponse && response.error != null) {
        throw Exception('Erro: ${response.error!.message}');
      }
      return (response as List).cast<Map<String, dynamic>>();
    } catch (e) {
      rethrow;
    }
  }

  // Método genérico para inserir dados
  Future<void> postData(String table, Map<String, dynamic> body) async {
    try {
      final response = await client.from(table).insert(body);
      if (response is PostgrestResponse && response.error != null) {
        throw Exception('Erro: ${response.error!.message}');
      }
    } catch (e) {
      rethrow;
    }
  }

  // Método genérico para atualizar dados
  Future<void> putData(String table, Map<String, dynamic> body, Map<String, dynamic> filters) async {
    try {
      var query = client.from(table).update(body);
      filters.forEach((key, value) {
        query = query.eq(key, value);
      });

      final response = await query;
      if (response is PostgrestResponse && response.error != null) {
        throw Exception('Erro: ${response.error!.message}');
      }
    } catch (e) {
      rethrow;
    }
  }

  // Método genérico para excluir dados
  Future<void> deleteData(String table, Map<String, dynamic> filters) async {
    try {
      var query = client.from(table).delete();
      filters.forEach((key, value) {
        query = query.eq(key, value);
      });

      final response = await query;
      if (response is PostgrestResponse && response.error != null) {
        throw Exception('Erro: ${response.error!.message}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
