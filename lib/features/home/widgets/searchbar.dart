import 'package:flutter/material.dart';

/**
* @author Giovane Neves
* @since v0.0.1
*/
class Searchbar extends StatelessWidget{

	@override
	Widget build(BuildContext context){

		return TextField(
            
            decoration: InputDecoration(
	            hintText: "O que você está buscando?",
	            prefixIcon: const Icon(Icons.search),
	            filled: true,
	            fillColor: Colors.grey.shade200,
	            border: OutlineInputBorder(
	                borderRadius: BorderRadius.circular(8),
	                borderSide: BorderSide.none,
	            ),
            ),
        );

	}

}