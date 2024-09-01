import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:corre_aqui/features/address/domain/models/address.dart';
import 'package:corre_aqui/util/constants.dart';

class ApiClient extends GetxService{

	String baseUrl;
	final SharedPreferences sharedPreferences;
	final String failToConnect = 'Ocorreu um erro na comunicação com o servidor';
	final int timeoutInSeconds = 50;

	String? token;
	late Map<String, String> _mainHeaders;

	ApiClient({required this.appBaseUrl, required this.sharedPreferences}) {

	    token = sharedPreferences.getString(Constants.token);
		Address? addressModel;

		try {

	      addressModel = AddressModel.fromJson(jsonDecode(sharedPreferences.getString(Constants.userAddress)!));
	    
	    }catch(_) {}
	    
	    updateHeader(
	      token,
	      address?.latitude,
	      address?.longitude
	    );

	}

	/**
	* Atualiza os cabeçalhos da requisição http.
	*/
	Map<String, String> updateHeader(String? token, String? latitude, String? longitude, {bool setHeader = true}) {
	    
	    Map<String, String> header = {};

	    header.addAll({
	      'Content-Type': 'application/json; charset=UTF-8',
	      AppConstants.latitude: latitude != null ? jsonEncode(latitude) : '',
	      AppConstants.longitude: longitude != null ? jsonEncode(longitude) : '',
	      'Authorization': 'Bearer $token'
	    });

	    if(setHeader) {
	      _mainHeaders = header;
	    }

	    return header;
	}

	Future<Response> getData(String uri, {Map<String, dynamic>? query, Map<String, String>? headers, bool handleError = true}) async {
	    try {

	      http.Response response = await http.get(
	        Uri.parse(appBaseUrl+uri),
	        headers: headers ?? _mainHeaders,
	      ).timeout(Duration(seconds: timeoutInSeconds));
	      return handleResponse(response, uri, handleError);

	    } catch (e) {
	      return Response(statusCode: 1, statusText: noInternetMessage);
	    }
  	}
}