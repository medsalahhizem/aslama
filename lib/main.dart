import 'package:aslama/restaurant/restaurantType.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'catalog.dart';
import 'LoginPage.dart';
import 'SignUpPage.dart';
import 'description.dart';
import 'hotel/hotel.dart';
import 'hotel/hotelRegion.dart';
import 'hotel/booked_hotel_details.dart';
import 'hotel/booked_hotels_page.dart';

import 'restaurant/restaurant.dart';
import 'restaurant/restaurantType.dart';
import 'firebase_options.dart'; // Import the firebase_options.dart file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(useMaterial3: true),
      initialRoute: '/',
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/': (context) => StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // User is signed in
                  return MainScreen();
                } else {
                  // User is not signed in
                  return LoginPage();
                }
              },
            ),
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
            region: ModalRoute.of(context)?.settings.arguments as String ??
                'Sahel'),
        '/restaurantType': (context) =>
            const RestaurantTypePage(), // Add this line
        '/restaurant': (context) => RestaurantPage(
            type: ModalRoute.of(context)?.settings.arguments as String ??
                'Modern'),
        '/booked-hotels': (context) =>
            const BookedHotelsPage(), // Add this line
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
            onPressed: () {
              // Navigate to the login page after logging out
              FirebaseAuth.instance.signOut().then((_) {
                Navigator.pushReplacementNamed(context, '/login');
              });
            },
            icon: const Icon(
              Icons.logout,
              size: 30,
            ),
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
            ListTile(
              title: const Text('Booked Hotels'),
              onTap: () {
                Navigator.pushNamed(context, '/booked-hotels');
              },
            ),
          ],
        ),
      ),
      body: const Catalog(),
    );
  }
}
