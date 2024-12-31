import 'package:corre_aqui/features/store/domain/models/store.dart';
import 'package:corre_aqui/features/store/domain/services/store_service_interface.dart';
import 'package:get/get.dart';

class StoreController extends GetxController implements GetxService{

	final StoreServiceInterface storeService;

	StoreController({required this.storeService});

	List<Store> _stores = [];
	List<Store> get stores => _stores;

	@override
	void onInit() {

	  super.onInit();
	  getStoreList();

	}
	
	Future<void> getStoreList() async{

		_stores = await storeService.getStoreList();
		update();

	} 



}