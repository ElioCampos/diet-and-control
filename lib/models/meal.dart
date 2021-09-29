class Meal{
  String name;
  String type;
  String description;
  String imageUrl;
  bool completed;

  Meal({required this.name, required this.type, required this.description, required this.imageUrl, required this.completed});
}

List<Meal> meals = [
  Meal(name: "Avena con frutas", type: "Desayuno", description: "1/2 taza de avena en hojuelas con leche descremada y 1/2 taza de frutos rojos, manzana o banana.", completed: false, imageUrl: "https://hispanaglobal.com/wp-content/uploads/2018/09/IMG_6564-1-768x1024-2.jpg"),
  Meal(name: "Pan con avocado", type: "Desayuno", description: "Rebanada de pan con palta.", completed: false, imageUrl: "https://previews.123rf.com/images/goodween123/goodween1231512/goodween123151200160/49339366-pan-de-centeno-tostado-con-aguacate-y-hierbas-en-rodajas-s%C3%A1ndwich-r%C3%BAstica-sencilla.jpg"),
  Meal(name: "Lomo de res", type: "Almuerzo", description: "Lomito de res con champignones y cebolla picada.", completed: false, imageUrl: "https://www.goya.com/media/3936/savory-beef-tenderloin.jpg"),
  Meal(name: "Lomo de res 2", type: "Almuerzo", description: "Lomito de res con champignones y cebolla picada.", completed: false, imageUrl: "https://www.goya.com/media/3936/savory-beef-tenderloin.jpg"),
  Meal(name: "Lomo de res 3", type: "Almuerzo", description: "Lomito de res con champignones y cebolla picada.", completed: false, imageUrl: "https://www.goya.com/media/3936/savory-beef-tenderloin.jpg"),
  Meal(name: "Pure de papas", type: "Cena", description: "Pure hecho de papas.", completed: false, imageUrl: "https://decomidaperuana.com/wp-content/uploads/2019/03/pure-de-papa-receta.jpg"),
  Meal(name: "Pure de papas 2", type: "Cena", description: "Pure hecho de papas.", completed: false, imageUrl: "https://decomidaperuana.com/wp-content/uploads/2019/03/pure-de-papa-receta.jpg"),
  Meal(name: "Barrita de cereal", type: "Snack", description: "Barrita hecha de cereal.", completed: false, imageUrl: "https://biotrendies.com/wp-content/uploads/2017/03/barritas-cereales-debes-saber.jpg"),
];