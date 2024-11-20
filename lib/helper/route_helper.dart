import 'dart:convert';
import 'package:corre_aqui/features/auth/screens/forgot_password_screen.dart';
import 'package:corre_aqui/features/auth/screens/login_screen.dart';
import 'package:corre_aqui/features/auth/screens/signin_screen.dart';
import 'package:corre_aqui/features/home/screens/home_screen.dart';
import 'package:corre_aqui/features/notification/screens/notification_screen.dart';
import 'package:corre_aqui/features/offer-map/screens/offer_map_screen.dart';
import 'package:corre_aqui/features/store/screens/store_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/**
* Helper com todas as rotas para telas da aplicação.
*
* @author Giovane Neves
*
*/
class RouteHelper{

  static const String forgotPassword = '/forgot-password';
  static const String login = '/login';
  static const String home = '/home';
  static const String notification = '/notification';
  static const String offerMap = '/offer-map';
  static const String register = '/register';
  static const String storeList = '/store-list';

  static String getForgotPasswordScreen() => forgotPassword;
  static String getLoginScreen() => login;
  static String getHomeScreen() => home;
  static String getNotificationScreen() => notification;
  static String getOfferMapScreen() => offerMap;
  static String getRegisterScreen() => register;
  static String getStoreList() => storeList;

  // Registro de rotas [ Adicionar todas as rotas do app aqui ] 
  static List<GetPage> routes = [

    GetPage(name: forgotPassword, page: () => ForgotPasswordScreen()),
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: home, page: () => HomeScreen()),
  	GetPage(name: notification, page: () => NotificationScreen()),
    GetPage(name: offerMap, page: () => OfferMapScreen()),
    GetPage(name: register, page: () => SigninScreen()),
    GetPage(name: storeList, page: () => StoreListScreen()),
  ];

}