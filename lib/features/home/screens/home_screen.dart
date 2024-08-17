import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.location_on, color: Colors.orange),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("CorreAqui", style: TextStyle(color: Colors.blue)),
            Text("Av. Raimundo Bonfim, N° 520", style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.grey),
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
                prefixIcon: Icon(Icons.search, color: Colors.grey),
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
                  image: AssetImage('assets/images/promo.jpg'), // Substitua pelo seu caminho de imagem
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                'Bom fim de semana\n25% OFF\n*para Todos os Itens*',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text("Categorias", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
            Text("Popular", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            _buildPopularItem(),
            SizedBox(height: 10),
            _buildPopularItem(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.grey),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: Colors.grey),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_pin, color: Colors.red),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Colors.grey),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.grey),
            label: '',
          ),
        ],
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
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 30, color: Colors.blue),
        ),
        SizedBox(height: 5),
        Text(title, style: TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildPopularItem() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage('assets/images/promo.jpg'), // Substitua pelo seu caminho de imagem
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        'Popular Item',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
