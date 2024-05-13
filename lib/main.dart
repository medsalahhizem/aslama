import 'package:flutter/material.dart';
import 'auth/LoginPage.dart';
import 'auth/SignupPage.dart';
import 'catalog.dart';
import 'description.dart';
import 'hotel/hotel.dart';
import 'hotel/hotelRegion.dart';
import 'restaurant/restaurant.dart';
import 'restaurant/restaurantType.dart';
import '../database_helper.dart'; // Make sure to import your database helper
import 'hotel/BookedHotelsPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.instance.database; // Ensure database is initialized
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(useMaterial3: true),
      initialRoute: '/login',
      routes: {
        '/': (context) => const MainScreen(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/beach': (context) => const DescriptionPage(title: 'Beach'),
        '/cuisine': (context) => const DescriptionPage(title: 'Cuisine'),
        '/Hiking': (context) => const DescriptionPage(title: 'Hiking'),
        '/Ice': (context) => const DescriptionPage(title: 'Ice'),
        '/desert': (context) => const DescriptionPage(title: 'Desert'),
        '/old cities': (context) => const DescriptionPage(title: 'Old Cities'),
        '/Historical places': (context) =>
            const DescriptionPage(title: 'Historical Places'),
        '/River': (context) => const DescriptionPage(title: 'River'),
        '/hotelRegion': (context) => const HotelRegionPage(),
        '/hotels': (context) => HotelPage(
            region: ModalRoute.of(context)?.settings.arguments as String ??
                'Sahel'),
        '/restaurantType': (context) => const RestaurantTypePage(),
        '/restaurant': (context) => RestaurantPage(
            type: ModalRoute.of(context)?.settings.arguments as String ??
                'Modern'),
        '/bookedHotels': (context) => const BookedHotelsPage(),
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
                Scaffold.of(context).openDrawer();
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
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
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
              title: const Text('Booked Hotels'),
              onTap: () {
                Navigator.pushNamed(context, '/bookedHotels');
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
                Navigator.pushNamed(context, '/restaurantType');
              },
            ),
          ],
        ),
      ),
      body: const Catalog(),
    );
  }
}
