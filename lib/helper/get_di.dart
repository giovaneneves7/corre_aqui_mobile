import 'package:corre_aqui/api/supabase_api_client.dart';
import 'package:corre_aqui/features/banner/controllers/banner_controller.dart';
import 'package:corre_aqui/features/banner/domain/repositories/banner_repository_interface.dart';
import 'package:corre_aqui/features/banner/domain/repositories/banner_repository.dart';
import 'package:corre_aqui/features/banner/domain/services/banner_service.dart';
import 'package:corre_aqui/features/banner/domain/services/banner_service_interface.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, Map<String, String>>> init() async {

	final supabaseClient = SupabaseApiClient(
    	client: Supabase.instance.client,
    	authToken: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1weXlvb3N3Y3Vka2dvdWlvbXVvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzMwNTk5OTgsImV4cCI6MjA0ODYzNTk5OH0.zjQSRDm22Q8A-hCGyLLd9MObB9pIMCmf9bKg9aaE6AA',
  	);
	final sharedPreferences = await SharedPreferences.getInstance();

	Get.lazyPut(() => sharedPreferences);
	//Get.lazyPut(() => SupabaseApiClient(client: supabaseClient, authToken: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1weXlvb3N3Y3Vka2dvdWlvbXVvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzMwNTk5OTgsImV4cCI6MjA0ODYzNTk5OH0.zjQSRDm22Q8A-hCGyLLd9MObB9pIMCmf9bKg9aaE6AA', sharedPreferences: Get.find()));

	// Repositories
	//BannerRepositoryInterface bannerRepositoryInterface = BannerRepository(apiClinet: Get.find());
	//Get.lazyPut(() => bannerRepositoryInterface);

	// Services
	//BannerServiceInterface bannerServiceInterface = BannerService(bannerRepositoryInterface: Get.find());
	//Get.lazyPut(() => bannerServiceInterface);

	// Controllers
	//Get.lazyPut(() => BannerController(bannerServiceInterface: bannerServiceInterface));
	
}