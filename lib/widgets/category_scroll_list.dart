import 'package:flutter/material.dart';
import 'category_item.dart'; // Import your CategoryItem widget

class CategoryScrollList extends StatelessWidget {
  const CategoryScrollList({super.key});

  final List<List<Map<String, String>>> categoryPairs = const [
    [
      {'image': 'assets/images/mobile.png', 'label': 'Mobiles'},
      {'image': 'assets/images/Tv.png', 'label': 'TVs'},
    ],
    [
      {'image': 'assets/images/shoes.png', 'label': 'Shoes'},
      {'image': 'assets/images/laptop.png', 'label': 'Laptops'},
    ],
    [
      {'image': 'assets/images/clothes.png', 'label': 'Clothes'},
      {'image': 'assets/images/headphone.png', 'label': 'Headphones'},
    ],
    [
      {'image': 'assets/images/watch.png', 'label': 'Watches'},
      {'image': 'assets/images/tablet.png', 'label': 'Tablets'},
    ],
    [
      {'image': 'assets/images/books.png', 'label': 'Books'},
      {'image': 'assets/images/furnitures.png', 'label': 'Furniture'},
    ],
    [
      {'image': 'assets/images/laptop.png', 'label': 'Laptops'},
      {'image': 'assets/images/mobile.png', 'label': 'Mobiles'},
    ],
    [
      {'image': 'assets/images/watch.png', 'label': 'Watches'},
      {'image': 'assets/images/clothes.png', 'label': 'Clothes'},
    ],
    [
      {'image': 'assets/images/tablet.png', 'label': 'Tablets'},
      {'image': 'assets/images/shoes.png', 'label': 'Shoes'},
    ],
    [
      {'image': 'assets/images/Tv.png', 'label': 'TVs'},
      {'image': 'assets/images/books.png', 'label': 'Books'},
    ],
    [
      {'image': 'assets/images/headphone.png', 'label': 'Headphones'},
      {'image': 'assets/images/furnitures.png', 'label': 'Furniture'},
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categoryPairs.length,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final pair = categoryPairs[index];
          return Column(
            children: [
              CategoryItem(
                imagePath: pair[0]['image']!,
                label: pair[0]['label']!,
              ),
              const SizedBox(height: 20),
              CategoryItem(
                imagePath: pair[1]['image']!,
                label: pair[1]['label']!,
              ),
            ],
          );
        },
      ),
    );
  }
}
