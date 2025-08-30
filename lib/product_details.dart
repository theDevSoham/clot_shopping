import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String title;
  final double price;
  final List<String> images;

  const ProductDetailsScreen({
    super.key,
    required this.title,
    required this.price,
    required this.images,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  String selectedSize = "M";
  String selectedColor = "Black";

  void _showSizeSelector() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        final sizes = ["S", "M", "L", "XL", "2XL"];
        return _buildOptionSelector("Size", sizes, selectedSize, (value) {
          setState(() => selectedSize = value);
        });
      },
    );
  }

  void _showColorSelector() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        final colors = ["Orange", "Black", "Red", "Yellow", "Blue"];
        return _buildOptionSelector("Color", colors, selectedColor, (value) {
          setState(() => selectedColor = value);
        });
      },
    );
  }

  Widget _buildOptionSelector(
    String title,
    List<String> options,
    String selected,
    Function(String) onSelect,
  ) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ...options.map((option) {
            final isSelected = option == selected;
            return GestureDetector(
              onTap: () {
                onSelect(option);
                Navigator.pop(context);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.purple : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Text(
                      option,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    const Spacer(),
                    if (isSelected)
                      const Icon(Icons.check, color: Colors.white),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.favorite_border), onPressed: () {}),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Image carousel
          SizedBox(
            height: 300,
            child: PageView.builder(
              itemCount: widget.images.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(widget.images[index], fit: BoxFit.cover),
                );
              },
            ),
          ),
          const SizedBox(height: 16),

          // Product info
          Text(
            widget.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            "\$${widget.price}",
            style: const TextStyle(fontSize: 18, color: Colors.purple),
          ),

          const SizedBox(height: 20),

          // Size selector
          ListTile(
            title: const Text("Size"),
            subtitle: Text(selectedSize),
            trailing: const Icon(Icons.keyboard_arrow_down),
            onTap: _showSizeSelector,
          ),
          const Divider(),

          // Color selector
          ListTile(
            title: const Text("Color"),
            subtitle: Text(selectedColor),
            trailing: const Icon(Icons.keyboard_arrow_down),
            onTap: _showColorSelector,
          ),
          const Divider(),

          // Description
          const SizedBox(height: 20),
          const Text(
            "Description",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "A versatile and stylish Harrington jacket, perfect for all seasons. Made from high-quality fabric with a comfortable fit.",
          ),
        ],
      ),

      // Bottom action button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          onPressed: () {},
          child: const Text(
            "Add to Bag",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
