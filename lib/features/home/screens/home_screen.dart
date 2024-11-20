import 'package:corre_aqui/features/store/screens/store_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:corre_aqui/common/widgets/custom_bottom_navigation_bar.dart';
import 'package:corre_aqui/helper/route_helper.dart';
import 'package:corre_aqui/features/offer-map/screens/offer_map_screen.dart';
import 'package:corre_aqui/features/profile/screens/profile_screen.dart';
import 'package:corre_aqui/features/favorite/screens/favorite_screen.dart';
import 'package:corre_aqui/features/notification/screens/notification_screen.dart';
import 'package:corre_aqui/features/home/screens/home_offer_screen.dart';
import 'package:corre_aqui/features/event/screens/event_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
        leading: Icon(
                  Icons.location_on, 
                  color: Theme.of(context).appBarTheme.backgroundColor
                ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Corre Aqui!", style: Theme.of(context).textTheme.bodyLarge),
            Text("Av. Raimundo Bonfim, N° 520", style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
                    Icons.notifications, 
                    color: Theme.of(context).appBarTheme.backgroundColor
                  ),
            onPressed: () {
              Get.toNamed(RouteHelper.getNotificationScreen());
            },
          ),
        ],
      ),
      body: 
      IndexedStack(
        index: _selectedIndex,
        children: [
          HomeOfferScreen(), // Tela principal
          EventScreen(), // Tela que será substituida futuramente
          OfferMapScreen(), // Tela do Mapa
          //FavoriteScreen(), // Tela de Favoritos
          StoreListScreen(),
          ProfileScreen(), // Tela de Perfil
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onItemTapped(2), // Ação para o botão de localização
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
                Icons.location_pin,  
                color: Colors.white, 
                size: 50
              ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

}
