import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, Map<String, String>>> init() async {

	final sharedPreferences = await SharedPreferences.getInstance();
	Get.lazyPut(() => sharedPreferences);
}