import 'package:flutter/material.dart';

class TrackOrderScreen extends StatelessWidget {
  final String orderId;
  const TrackOrderScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final List<Map<String, dynamic>> steps = [
      {"title": "Delivered", "date": "28 May", "done": false},
      {"title": "Shipped", "date": "28 May", "done": true},
      {"title": "Order Confirmed", "date": "28 May", "done": true},
      {"title": "Order Placed", "date": "28 May", "done": true},
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.scaffoldBackgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Order $orderId"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Timeline
            ...steps.map(
              (step) => ListTile(
                leading: CircleAvatar(
                  backgroundColor: step["done"]
                      ? theme.primaryColor
                      : Colors.grey.shade300,
                  child: Icon(Icons.check, color: Colors.white, size: 18),
                ),
                title: Text(
                  step["title"],
                  style: TextStyle(
                    color: step["done"] ? Colors.black : Colors.grey,
                    fontWeight: step["done"]
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                trailing: Text(
                  step["date"],
                  style: TextStyle(
                    color: step["done"] ? Colors.black : Colors.grey,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Order items
            Text(
              "Order Items",
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.secondaryHeaderColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Row(
                    children: [
                      Icon(Icons.receipt_long),
                      SizedBox(width: 8),
                      Text("4 items"),
                    ],
                  ),
                  Text(
                    "View All",
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Shipping details
            Text(
              "Shipping details",
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.secondaryHeaderColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "2715 Ash Dr. San Jose, South Dakota 83475\n121-224-7890",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
