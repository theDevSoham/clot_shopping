import 'package:clot_shopping/category_products.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final List<Map<String, String>> categories = const [
    {"title": "Hoodies", "image": "assets/hoodies.png"},
    {"title": "Shorts", "image": "assets/shorts.png"},
    {"title": "Shoes", "image": "assets/shoes.png"},
    {"title": "Bags", "image": "assets/bag.png"},
    {"title": "Accessories", "image": "assets/accessories.png"},
    {"title": "Jackets", "image": "assets/jacket.png"},
  ];

  // Example product data per category
  Map<String, List<Map<String, dynamic>>> productsByCategory = {
    "Hoodies": [
      {
        "title": "Nike Club Hoodie",
        "price": 65.00,
        "image": "assets/hoodies.png",
      },
      {
        "title": "Adidas Zip Hoodie",
        "price": 72.00,
        "image": "assets/hoodies.png",
      },
    ],
    "Shorts": [
      {"title": "Running Shorts", "price": 35.00, "image": "assets/shorts.png"},
      {"title": "Casual Shorts", "price": 40.00, "image": "assets/shorts.png"},
    ],
    "Shoes": [
      {"title": "Air Max 270", "price": 150.00, "image": "assets/shoes.png"},
      {"title": "Yeezy Boost", "price": 220.00, "image": "assets/shoes.png"},
    ],
    "Bags": [
      {"title": "Backpack", "price": 60.00, "image": "assets/bag.png"},
      {"title": "Shoulder Bag", "price": 50.00, "image": "assets/bag.png"},
    ],
    "Accessories": [
      {"title": "Cap", "price": 25.00, "image": "assets/accessory.png"},
      {"title": "Sunglasses", "price": 45.00, "image": "assets/accessory.png"},
    ],
    "Jackets": [
      {"title": "Bomber Jacket", "price": 120.00, "image": "assets/jacket.png"},
      {
        "title": "Leather Jacket",
        "price": 200.00,
        "image": "assets/jacket.png",
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Shop by Categories",
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final category = categories[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryProductsScreen(
                      category: category["title"]!,
                      products: productsByCategory[category["title"]] ?? [],
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: theme.secondaryHeaderColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset(
                          category["image"]!,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      category["title"]!,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
