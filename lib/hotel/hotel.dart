import 'package:flutter/material.dart';

class HotelPage extends StatelessWidget {
  final String region;

  const HotelPage({Key? key, required this.region}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Hotel> hotels = getHotelsForRegion(region);

    return Scaffold(
      appBar: AppBar(
        title: Text('Hotels in $region'),
      ),
      body: ListView.builder(
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          return HotelListTile(hotel: hotels[index]);
        },
      ),
    );
  }

  List<Hotel> getHotelsForRegion(String region) {
    // Hardcoded list of hotels for the Sahel region
    if (region == 'Sahel') {
      return [
        Hotel(
          name: 'Hotel Hasdrubal Thalassa & Spa',
          location: 'Sousse',
          rating: 4.5,
          imageAsset: 'images/hotels/thalasso.jpg',
        ),
        Hotel(
          name: 'Sentido Phenicia',
          location: 'Hammamet',
          rating: 4.2,
          imageAsset: 'images/hotels/Sentido.jpg',
        ),
        Hotel(
          name: 'Hotel El Mouradi Cap Serrat',
          location: 'Bizerte',
          rating: 4.0,
          imageAsset: 'images/hotels/Mouradi.jpg',
        ),
        // Add more hotels as needed
      ];
    } else if (region == 'South') {
      return [
        Hotel(
          name: 'Hotel El Mouradi Cap Serrat',
          location: 'Bizerte',
          rating: 4.0,
          imageAsset: 'images/hotels/Mouradi.jpg',
        ),
        // Add more hotels as needed
      ];
    } else if (region == 'North') {
      return [
        Hotel(
          name: 'Hotel El Mouradi Cap Serrat',
          location: 'Bizerte',
          rating: 4.0,
          imageAsset: 'images/hotels/Mouradi.jpg',
        ),
        // Add more hotels as needed
      ];
    } else if (region == 'West') {
      return [
        Hotel(
          name: 'Hotel El Mouradi Cap Serrat',
          location: 'Bizerte',
          rating: 4.0,
          imageAsset: 'images/hotels/Mouradi.jpg',
        ),
        // Add more hotels as needed
      ];
    } else {
      return []; // Return an empty list for other regions
    }
  }
}

class Hotel {
  final String name;
  final String location;
  final double rating;
  final String imageAsset;

  Hotel({
    required this.name,
    required this.location,
    required this.rating,
    required this.imageAsset,
  });
}

class HotelListTile extends StatelessWidget {
  final Hotel hotel;

  const HotelListTile({Key? key, required this.hotel}) : super(key: key);

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
              hotel.imageAsset,
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
                    hotel.name,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    hotel.location,
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
                        hotel.rating.toString(),
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
