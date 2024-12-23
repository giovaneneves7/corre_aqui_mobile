import 'package:flutter/material.dart';
import 'package:corre_aqui/features/favorite/widgets/favorite_store_card_widget.dart';
import 'package:corre_aqui/features/store/domain/models/store.dart';

/**
* Tela responsável por exibir os estabelecimentos marcados como
* favoritos pelo usuário.
*
* @author Giovane Neves
*/
class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  
  final List<Store> favoriteStores = [
    Store('12345', 'AGES', 'assets/images/ages.jpg'),
    Store('12345', 'EnoveSolar', 'assets/images/enove_solar.jpeg'),
    Store('12345', 'Geocomercial', 'assets/images/geocomercial.png'),
    Store('12345', 'Quy Sorwetto', 'assets/images/quy_sorvetto.png'),
    Store('12345', 'Tropical Motos', 'assets/images/tropical_motos.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: favoriteStores.length,
        itemBuilder: (context, index) {
          return FavoriteCard(store: favoriteStores[index]);
        },
      ),
    );
  }
  
}