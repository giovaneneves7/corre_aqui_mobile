import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:corre_aqui/helper/route_helper.dart';
import 'package:corre_aqui/util/images.dart';

/*
* Tela de inicío da aplicação após a SplashScreen.
*
* @author Giovane Neves
*/
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
              const SizedBox(height: 20),
              const Text(
                'Corre aqui!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Seja Rápido, Economize Mais.\nNão Perca Tempo, Nem Dinheiro!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(RouteHelper.getOfferMapScreen());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFff0000), // fundo
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
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Get.toNamed(RouteHelper.getAuthGateScreen());
                },
                child: const Row(
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
