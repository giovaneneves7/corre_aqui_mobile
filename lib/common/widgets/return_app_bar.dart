import 'package:flutter/material.dart';

/**
* @author Giovane Neves
* @since v0.0.1
*/
class ReturnAppBar extends StatelessWidget{

	@override
	Widget build(BuildContext context){

		return AppBar(
       		leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: Colors.white,
            elevation: 0,
        );

	}

}