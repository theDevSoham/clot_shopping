import 'package:clot_shopping/home_Screen.dart';
import 'package:clot_shopping/notification_screen.dart';
import 'package:clot_shopping/order_screen.dart';
import 'package:flutter/material.dart';

class BottomNavParent extends StatefulWidget {
  const BottomNavParent({super.key});

  @override
  State<BottomNavParent> createState() => _BottomNavParentState();
}

class _BottomNavParentState extends State<BottomNavParent> {
  @override
  Widget build(BuildContext context) {
    return const RootApp();
  }
}

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const NotificationsScreen(),
    const OrdersScreen(),
    Center(child: Text("Profile screen coming soon...")), // Placeholder
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }
}
