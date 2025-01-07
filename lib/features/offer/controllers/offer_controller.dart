import 'package:corre_aqui/features/offer/domain/models/offer.dart';
import 'package:corre_aqui/features/offer/domain/services/offer_service_interface.dart';
import 'package:get/get.dart';

/**
* @author Giovane Neves
* @since v0.0.1
*/
class OfferController extends GetxController implements GetxService {

	final OfferServiceInterface offerServiceInterface;

	OfferController({required this.offerServiceInterface});

	List<Offer> _offerList = [];
	List<Offer> get offerList => _offerList;


	@override
	void onInit() {

	  super.onInit();
	  getOfferList();

	}


	List<Offer> getOffersByStoreId(storeId){

		return _offerList.where((offer) => offer.storeId == storeId).toList();
		
	}

	Offer getOfferById(offerId){

		return _offerList.firstWhere((offer) => offer.id == offerId);

	}

	Future<void> getOfferList() async{

		try {
      		_offerList = await offerServiceInterface.getOfferList();
      		update();
    	} catch (e) {
      		print('Erro ao buscar eventos: $e');
    	}

	}

}


