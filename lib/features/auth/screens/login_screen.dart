import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:corre_aqui/helper/route_helper.dart';
import 'package:corre_aqui/util/images.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
  
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          Center(
            child: Image.asset(
              Images.logoRetangulo, 
              height: 200, 
            ),
          ),
            Text(
              'Faça login na sua conta',
              style: Theme.of(context).textTheme.headline6?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'É ótimo ver você novamente.',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(height: 24),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Digite seu endereço de e-mail',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                labelText: 'Senha',
                hintText: 'Digite sua senha',
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  RichText(
                    text: TextSpan(
                      text: 'Esqueceu a senha? ',
                      style: TextStyle(color: Theme.of(context).textTheme.bodyText1?.color), // Texto normal (preto)
                      children: [
                        TextSpan(
                          text: 'Redefina sua senha',
                          style: TextStyle(color: Theme.of(context).primaryColor), // Texto do botão (vermelho)
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Fazer o redirecionamento para tela de redefinir senha
                            },
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                
                if(_emailController.text.trim() == 'admin' && _passwordController.text.trim() == 'admin')
                  Get.toNamed(RouteHelper.getHomeScreen());

              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Login'),
            ),
            SizedBox(height: 24),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Não tem uma conta? ',
                  style: TextStyle(color: Theme.of(context).textTheme.bodyText1?.color), // Texto normal (preto)
                  children: [
                    TextSpan(
                      text: 'Cadastre-se',
                      style: TextStyle(color: Theme.of(context).primaryColor), // Texto do botão (vermelho)
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Fazer o redirecionamento para tela de cadastro
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

}
