import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:corre_aqui/features/notification/screens/notification_screen.dart';

class RouteHelper{

  static const String notification = '/notification';

  static String getNotificationScreen() => notification;

  // Registro de rotas [ Adicionar todas as rotas do app aqui ] 
  static List<GetPage> routes = [

  	GetPage(name: notification, page: () => NotificationScreen()),

  ];

}