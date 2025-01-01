import 'package:flutter/material.dart';

class OffersByCategoryScreen extends StatefulWidget {

  final int categoryId;

  OffersByCategoryScreen({required this.categoryId});

  @override
  _OffersByCategoryScreen createState() => _OffersByCategoryScreen();
}

class _OffersByCategoryScreen extends State<OffersByCategoryScreen> {


  @override
  Widget build(BuildContext context){

    return Row(
      children: [
        Text('Nada para ver aqui na categoria ${widget.categoryId}'),
      ],
    );

  }

}