/**
* Classe que representa uma categoria.
*
* @author Giovane Neves
*/
class Category{

	String name;
	String imageUrl;

	Category({required this.name, required this.imageUrl});

	factory Category.fromJson(Map<String, dynamic> json) {
	    return Category(
	      name: json['name'],
	      imageUrl: json['image_url'],
	    );
	}

	Map<String, dynamic> toJson() {
	    return {
	      'name': name,
	      'image_url': imageUrl,
	    };
	}

}