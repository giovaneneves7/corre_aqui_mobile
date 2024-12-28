import 'package:corre_aqui/features/category/domain/services/category_service_interface.dart';
import 'package:get/get.dart';

/**
* @author Giovane Neves
* @since v0.0.1
*/
class CategoryController extends GetxController implements GetxService {

	final CategoryServiceInterface categoryServiceInterface;

	CategoryController({required this.categoryServiceInterface});

}