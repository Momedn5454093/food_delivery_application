class FoodItem {
  final String name;
  final String imageUrl;
  final double price;
  final bool isFavorite;
  const FoodItem({
    required this.name,
    required this.imageUrl,
    required this.price,
    this.isFavorite = false,
  });
  FoodItem copyWith({
    String? name,
    String? imageUrl,
    double? price,
    bool? isFavorite,
  }) {
    return FoodItem(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

List<FoodItem> food = [
  FoodItem(
    name: 'Pizza Margherita',
    imageUrl:
        'https://tse3.mm.bing.net/th/id/OIP.S3Lq_-y1J7AGkRC0bL6CzgHaJQ?rs=1&pid=ImgDetMain&o=7&rm=3',
    price: 8.99,
  ),
  FoodItem(
    name: 'Burger',
    imageUrl:
        'https://tse1.mm.bing.net/th/id/OIP.TzB80tTYvvReplXIN7OTnAHaHa?rs=1&pid=ImgDetMain&o=7&rm=3',
    price: 12.50,
  ),
  FoodItem(
    name: 'Caesar Salad',
    imageUrl:
        'https://tse3.mm.bing.net/th/id/OIP.Qt_BMmM0-Y5WQX7qrJjTZAHaLJ?rs=1&pid=ImgDetMain&o=7&rm=3',
    price: 7.25,
  ),
  FoodItem(
    name: 'Spaghetti Carbonara',
    imageUrl:
        'https://www.modernhoney.com/wp-content/uploads/2023/02/Spaghetti-Carbonara-3-crop-scaled.jpg',
    price: 9.75,
  ),
];
