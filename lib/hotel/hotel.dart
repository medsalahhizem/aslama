import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth
import 'package:cloud_firestore/cloud_firestore.dart'; // Import FirebaseFirestore

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
          price: 'DT 150', // Example price
        ),
        Hotel(
          name: 'Sentido Phenicia',
          location: 'Hammamet',
          rating: 4.2,
          imageAsset: 'images/hotels/Sentido.jpg',
          price: 'DT 120', // Example price
        ),
        Hotel(
          name: 'Hotel El Mouradi',
          location: 'Mahdia',
          rating: 4.0,
          imageAsset: 'images/hotels/Mouradi.jpg',
          price: 'DT 100', // Example price
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
          price: 'DT 90', // Example price
        ),
        // Add more hotels as needed
      ];
    } else if (region == 'North') {
      return [
        Hotel(
          name: 'Hotel El Mouradi ',
          location: 'Bizerte',
          rating: 4.0,
          imageAsset: 'images/hotels/Mouradi.jpg',
          price: 'DT 80', // Example price
        ),
        // Add more hotels as needed
      ];
    } else if (region == 'interior') {
      return [
        Hotel(
          name: 'Hotel El Mouradi Cap Serrat',
          location: 'Bizerte',
          rating: 4.0,
          imageAsset: 'images/hotels/Mouradi.jpg',
          price: 'DT 70', // Example price
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
  final String price; // Added price field

  Hotel({
    required this.name,
    required this.location,
    required this.rating,
    required this.imageAsset,
    required this.price, // Initialize price field
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                      Text(
                        hotel.price,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => BookingModal(hotel: hotel),
                      );
                    },
                    child: const Text('Book'),
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

class BookingModal extends StatefulWidget {
  final Hotel hotel;

  const BookingModal({Key? key, required this.hotel}) : super(key: key);

  @override
  _BookingModalState createState() => _BookingModalState();
}

class _BookingModalState extends State<BookingModal> {
  int _nights = 1;
  int _adults = 1;
  int _children = 0;
  DateTime _startDate = DateTime.now();
  DateTime _endDate =
      DateTime.now().add(Duration(days: 1)); // Default to one night

  @override
  Widget build(BuildContext context) {
    _nights = _endDate.difference(_startDate).inDays;

    final totalPrice = (widget.hotel.price.replaceAll('DT', '').trim() != '')
        ? (double.parse(widget.hotel.price.replaceAll('DT', '').trim()) *
                _nights *
                (_adults + _children / 2))
            .toStringAsFixed(2)
        : 'N/A';
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.hotel.name,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Nights:'),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _nights = _nights > 1 ? _nights - 1 : 1;
                      });
                    },
                    icon: const Icon(Icons.remove),
                  ),
                  Text(_nights.toString()),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _nights++;
                      });
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Start Date:'),
              TextButton(
                onPressed: () async {
                  final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: _startDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null && pickedDate != _startDate) {
                    setState(() {
                      _startDate = pickedDate;
                    });
                  }
                },
                child: Text(_startDate.toIso8601String()),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('End Date:'),
              TextButton(
                onPressed: () async {
                  final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: _endDate,
                    firstDate: _startDate,
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null && pickedDate != _endDate) {
                    setState(() {
                      _endDate = pickedDate;
                    });
                  }
                },
                child: Text(_endDate.toIso8601String()),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Adults:'),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _adults = _adults > 1 ? _adults - 1 : 1;
                      });
                    },
                    icon: const Icon(Icons.remove),
                  ),
                  Text(_adults.toString()),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _adults++;
                      });
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Children:'),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _children = _children > 0 ? _children - 1 : 0;
                      });
                    },
                    icon: const Icon(Icons.remove),
                  ),
                  Text(_children.toString()),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _children++;
                      });
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Text(
            'Total Price: \$${totalPrice == 'N/A' ? totalPrice : double.parse(totalPrice)}',
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              final userId = FirebaseAuth.instance.currentUser?.uid;
              if (userId != null) {
                FirebaseFirestore.instance.collection('bookedHotels').add({
                  'userId': userId,
                  'hotelName': widget.hotel.name,
                  'location': widget.hotel.location,
                  'nights': _nights,
                  'adults': _adults,
                  'children': _children,
                  'totalPrice': double.parse(totalPrice),
                  'imageAsset': widget.hotel.imageAsset,
                  'startDate': _startDate.toIso8601String(), // Add start date
                  'endDate': _endDate.toIso8601String(), // Add end date
                });
                Navigator.pop(context);
              }
            },
            child: const Text('Book'),
          ),
        ],
      ),
    );
  }
}
