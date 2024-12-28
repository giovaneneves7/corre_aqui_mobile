import 'package:flutter/material.dart';
import 'package:get/get.dart';

/**
* @author Giovane Neves
* @since v0.0.1
*/
class CategoryList extends StatelessWidget{


	@override
	Widget build(BuildContext context){

		return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
	            _buildCategoryButton("Todos", isSelected: true),
	            _buildCategoryButton("Academia"),
	            _buildCategoryButton("Roupas"),
	            _buildCategoryButton("Supermercado"),
            ],
        );

	}

	Widget _buildCategoryButton(String title, {bool isSelected = false}) {
	    
	    return Container(
	      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
	      decoration: BoxDecoration(
	        color: isSelected ? Colors.red : Colors.grey.shade200,
	        borderRadius: BorderRadius.circular(16),
	      ),
	      child: Text(
	        title,
	        style: TextStyle(
	          color: isSelected ? Colors.white : Colors.black,
	          fontWeight: FontWeight.w500,
	        ),
	      ),
	    );
	    
	}
}