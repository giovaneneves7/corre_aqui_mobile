import 'package:flutter/material.dart';

class HomeOfferScreen extends StatefulWidget {
  const HomeOfferScreen({Key? key}) : super(key: key);

  @override
  _HomeOfferScreenState createState() => _HomeOfferScreenState();
}

class _HomeOfferScreenState extends State<HomeOfferScreen> {
  

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body:SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                              Icons.search, 
                              color: Theme.of(context).appBarTheme.backgroundColor
                            ),
                hintText: 'Pesquise Qualquer Coisa...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage('assets/images/promo.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                'Bom fim de semana\n25% OFF\n*para Todos os Itens*',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Text("Categorias", style: Theme.of(context).textTheme.headline6),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCategoryCard(Icons.restaurant, 'Alimentos'),
                _buildCategoryCard(Icons.devices_other, 'Equipamentos'),
                _buildCategoryCard(Icons.checkroom, 'Roupas'),
                _buildCategoryCard(Icons.chair, 'Móveis'),
              ],
            ),
            SizedBox(height: 20),
            Text("Popular", style: Theme.of(context).textTheme.headline6),
            SizedBox(height: 10),
            _buildPopularItem(),
            SizedBox(height: 10),
            _buildPopularItem(),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(IconData icon, String title) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
                  icon, 
                  size: 30, 
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
        ),
        SizedBox(height: 5),
        //Text(title, style: Theme.of(context).textTheme.bodyText1),
      ],
    );
  }

  Widget _buildPopularItem() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage('assets/images/chips.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        'Salgadinhos',
        style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.white),
      ),
    );
  }
}
