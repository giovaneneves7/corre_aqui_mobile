imort 'package:corre_aqui/features/banner/domain/models/banner.dart';
import 'package:get/get.dart';

class BannerRepository implements BannerRepositoryInterface {

	final SupabaseApiClient apiClient;

	BannerRepository({required this.apiClient});
	
	@override
  	Future<List<Banner> getList() async {

	    try {
	      
	    	final data = await apiClient.getData(
	    		'banners', 
	        	filters: {
	          	'active': true, 
	        	},
	      	);

	      	return data.map((json) => Banner.fromJson(json)).toList();

	    } catch (e) {
	      rethrow; 
	    }
  	}

}