import 'package:flutter/material.dart';
import 'catalog.dart'; // Import the catalog.dart file
import 'description.dart'; // Import the catalog.dart file
import 'hotel/hotel.dart'; // Import the catalog.dart file
import 'hotel/hotelRegion.dart'; // Import the catalog.dart file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(useMaterial3: true),
      initialRoute: '/', // Set the initial route
      routes: {
        '/': (context) => const MainScreen(),
        '/beach': (context) => const DescriptionPage(title: 'Beach'),
        '/cuisine': (context) => const DescriptionPage(title: 'Cuisine'),
        '/Hiking': (context) =>
            const DescriptionPage(title: 'Hiking'), // Update route name
        '/Ice': (context) =>
            const DescriptionPage(title: 'Ice'), // Update route name
        '/desert': (context) => const DescriptionPage(title: 'Desert'),
        '/old cities': (context) =>
            const DescriptionPage(title: 'Old Cities'), // Update route name
        '/Historical places': (context) => const DescriptionPage(
            title: 'Historical Places'), // Update route name
        '/River': (context) =>
            const DescriptionPage(title: 'River'), // Update route name
        '/hotelRegion': (context) => const HotelRegionPage(), // Add this line
        '/hotels': (context) => HotelPage(
            region: ModalRoute.of(context)?.settings.arguments as String),
      },
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 100, 182),
        toolbarHeight: 60,
        elevation: 20,
        title: const Text(
          "ASLAMA👋",
          style: TextStyle(
            fontFamily: 'italic',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Open the drawer
              },
              icon: const Icon(
                Icons.menu,
                size: 30,
              ),
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.home,
              size: 30,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Hotels'),
              onTap: () {
                Navigator.pushNamed(context, '/hotelRegion');
              },
            ),
            ListTile(
              title: const Text('Guides'),
              onTap: () {
// Handle guide button tap
              },
            ),
            ListTile(
              title: const Text('Restaurants'),
              onTap: () {
// Handle hotel button tap
              },
            ),
          ],
        ),
      ),
      body: const Catalog(), // Display the Catalog widget in the body
    );
  }
}
