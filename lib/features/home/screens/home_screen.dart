import 'package:flutter/material.dart';
import 'package:corre_aqui/common/widgets/custom_bottom_navigation_bar.dart';

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
        leading: Icon(Icons.location_on, color: Theme.of(context).colorScheme.secondary),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("CorreAqui", style: Theme.of(context).textTheme.bodyText1),
            Text("Av. Raimundo Bonfim, N° 520", style: Theme.of(context).textTheme.bodyText2),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Theme.of(context).iconTheme.color),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Theme.of(context).iconTheme.color),
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
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 30, color: Theme.of(context).colorScheme.primary),
        ),
        SizedBox(height: 5),
        Text(title, style: Theme.of(context).textTheme.bodyText1),
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
          image: AssetImage('assets/images/promo.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        'Popular Item',
        style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.white),
      ),
    );
  }
}
