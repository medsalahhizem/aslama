import 'package:flutter/material.dart';

class RestaurantPage extends StatelessWidget {
  final String type;

  const RestaurantPage({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Restaurant> restaurants = getRestaurantForType(type);

    return Scaffold(
      appBar: AppBar(
        title: Text('$type Restaurants'),
      ),
      body: ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          return RestaurantListTile(restaurant: restaurants[index]);
        },
      ),
    );
  }

  List<Restaurant> getRestaurantForType(String type) {
    // Hardcoded list of hotels for the Sahel region
    if (type == 'Modern') {
      return [
        Restaurant(
          name: 'L’aromate Restaurant - Pizzeria',
          location: 'Sousse',
          rating: 3.8,
          imageAsset: 'images/restaurants/aromate.jpg',
        ),
        Restaurant(
          name: 'LE CHANDELIER - CANDLE HOUSE',
          location: 'Monastir',
          rating: 4.2,
          imageAsset: 'images/restaurants/chandelier.jpg',
        ),
        Restaurant(
          name: 'Le comptoire du Tunis',
          location: 'Tunis',
          rating: 4.0,
          imageAsset: 'images/restaurants/lecomptoire.jpeg',
        ),
        // Add more hotels as needed
      ];
    } else if (type == 'Traditional') {
      return [
        Restaurant(
          name: 'Dar Chraka',
          location: 'Monastir',
          rating: 4.0,
          imageAsset: 'images/restaurants/chraka.jpg',
        ),
        // Add more hotels as needed
      ];
    } else {
      return []; // Return an empty list for other regions
    }
  }
}

class Restaurant {
  final String name;
  final String location;
  final double rating;
  final String imageAsset;

  Restaurant({
    required this.name,
    required this.location,
    required this.rating,
    required this.imageAsset,
  });
}

class RestaurantListTile extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantListTile({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              restaurant.imageAsset,
              width: 100.0,
              height: 100.0,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    restaurant.location,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber[600],
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        restaurant.rating.toString(),
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
