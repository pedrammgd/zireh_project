class FoodViewModel {
  FoodViewModel(
      {required this.id,
      required this.title,
      required this.category,
      required this.description,
      required this.isLocalFood,
      required this.city,
      required this.suitableForMeals});

  final int id;
  final String title;
  final String category;
  final String description;
  final String suitableForMeals;
  final bool isLocalFood;
  final String city;

  factory FoodViewModel.fromJson(Map<String, dynamic> json) => FoodViewModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        category: json['category'],
        isLocalFood: json['isLocalFood'],
        city: json['city'],
        suitableForMeals: json['suitableForMeals'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'category': description,
        'isLocalFood': isLocalFood,
        'city': city,
        'suitableForMeals': suitableForMeals
      };
}
