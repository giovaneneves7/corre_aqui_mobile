import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:corre_aqui/features/notification/screens/notification_screen.dart';
import 'package:corre_aqui/features/offer-map/screens/offer_map.dart';

class RouteHelper{

  static const String notification = '/notification';
  static const String offerMap = '/offer-map';

  static String getNotificationScreen() => notification;
  static String getOfferMapScreen() => offerMap;

  // Registro de rotas [ Adicionar todas as rotas do app aqui ] 
  static List<GetPage> routes = [

  	GetPage(name: notification, page: () => NotificationScreen()),
    GetPage(name: offerMap, page: () => OfferMapScreen()),

  ];

}