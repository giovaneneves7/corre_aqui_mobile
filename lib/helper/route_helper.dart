import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:corre_aqui/features/auth/screens/login_screen.dart';
import 'package:corre_aqui/features/home/screens/home_screen.dart';
import 'package:corre_aqui/features/notification/screens/notification_screen.dart';
import 'package:corre_aqui/features/offer-map/screens/offer_map_screen.dart';

/**
* Helper com todas as rotas para telas da aplicação.
*
* @author Giovane Neves
*
*/
class RouteHelper{

  static const String login = '/login';
  static const String home = '/home';
  static const String notification = '/notification';
  static const String offerMap = '/offer-map';

  static String getLoginScreen() => login;
  static String getHomeScreen() => home;
  static String getNotificationScreen() => notification;
  static String getOfferMapScreen() => offerMap;

  // Registro de rotas [ Adicionar todas as rotas do app aqui ] 
  static List<GetPage> routes = [

    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: home, page: () => HomeScreen()),
  	GetPage(name: notification, page: () => NotificationScreen()),
    GetPage(name: offerMap, page: () => OfferMapScreen()),

  ];

}