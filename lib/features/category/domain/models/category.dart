/**
* Classe que representa uma categoria.
*
* @author Giovane Neves
*/
class Category{

	String name;
	String image;

	Category({required this.name, required this.image});

	factory Category.fromJson(Map<String, dynamic> json) {
	    return Category(
	      name: json['name'],
	      image: json['image'],
	    );
	}

	Map<String, dynamic> toJson() {
	    return {
	      'name': name,
	      'image': image,
	    };
	}

}