import 'package:corre_aqui/features/favorite/widgets/favorite_store_card_widget.dart';
import 'package:corre_aqui/features/store/domain/models/store.dart';
import 'package:flutter/material.dart';

class StoreListScreen extends StatefulWidget {
  const StoreListScreen({super.key});

  @override
  State<StoreListScreen> createState() => _StoreListScreenState();
}

class _StoreListScreenState extends State<StoreListScreen> {
  final List<Store> stores = [
    Store('AGES', 'assets/images/ages.jpg'),
    Store('EnoveSolar', 'assets/images/enove_solar.jpeg'),
    Store('Geocomercial', 'assets/images/geocomercial.png'),
    Store('Quy Sorwetto', 'assets/images/quy_sorvetto.png'),
    Store('Tropical Motos', 'assets/images/tropical_motos.png'),
  ];

  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Store> _filteredStores = [];

  void _filterStores(String query) {
    setState(() {
      _filteredStores = stores.where((store) =>
          store.name.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          onChanged: _filterStores,
          decoration: InputDecoration(
            hintText: 'Buscar Estabelecimento',
            border: InputBorder.none,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _filteredStores.length,
        itemBuilder: (context, index) {
          return FavoriteCard(store: _filteredStores[index]);
        },
      ),
    );
  }
}