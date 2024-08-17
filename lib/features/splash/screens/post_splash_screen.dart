import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:corre_aqui/util/images.dart';
import 'package:corre_aqui/features/home/screens/home_screen.dart';

class PostSplashScreen extends StatefulWidget {
  @override
  _PostSplashScreenState createState() => _PostSplashScreenState();
}

class _PostSplashScreenState extends State<PostSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey[200],
                child: Image.asset(
                  Images.logo,
                  width: 60,
                  height: 60,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Corre aqui!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Seja Rápido, Economize Mais.\nNão Perca Tempo, Nem Dinheiro!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Get.to(HomeScreen());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // fundo
                  foregroundColor: Colors.white, // texto
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text(
                  'Vamos começar',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Adicione a ação do botão aqui
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Eu já tenho uma conta',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.orange,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.orange,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
