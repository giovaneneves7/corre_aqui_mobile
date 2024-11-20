import 'package:corre_aqui/helper/route_helper.dart';
import 'package:corre_aqui/util/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';

/**
* Tela de Login do usuário.
*
* @author Giovane Neves
*/
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
            Text(
              'Faça login na sua conta',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'É ótimo ver você novamente.',
              style: Theme.of(context).textTheme.bodyMedium,
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
                      style: TextStyle(color: Theme.of(context).textTheme.bodyLarge!.color), 
                      children: [
                        TextSpan(
                          text: 'Redefina sua senha',
                          style: TextStyle(color: Theme.of(context).primaryColor), 
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(RouteHelper.getForgotPasswordScreen());
                            },
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 24),
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
            const SizedBox(height: 24),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Não tem uma conta? ',
                  style: TextStyle(color: Theme.of(context).textTheme.bodyLarge!.color), // Texto normal (preto)
                  children: [
                    TextSpan(
                      text: 'Cadastre-se',
                      style: TextStyle(color: Theme.of(context).primaryColor), // Texto do botão (vermelho)
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(RouteHelper.getRegisterScreen());
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
