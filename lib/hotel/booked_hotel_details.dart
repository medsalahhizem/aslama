import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import the cloud_firestore package

class BookedHotelDetailsPage extends StatefulWidget {
  final String hotelId;

  const BookedHotelDetailsPage({Key? key, required this.hotelId})
      : super(key: key);

  @override
  _BookedHotelDetailsPageState createState() => _BookedHotelDetailsPageState();
}

class _BookedHotelDetailsPageState extends State<BookedHotelDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booked Hotel Details'),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('bookedHotels')
            .doc(widget.hotelId)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!.data() as Map<String, dynamic>?;
          final hotelName = data?['hotelName'] as String? ?? '';
          final location = data?['location'] as String? ?? '';
          final nights = data?['nights'] as int? ?? 0;
          final adults = data?['adults'] as int? ?? 0;
          final startDate = data?['startDate'] as String? ?? '';
          final endDate = data?['endDate'] as String? ?? '';

          final children = data?['children'] as int? ?? 0;
          final totalPrice = data?['totalPrice'] as double? ?? 0.0;
          final imageAsset =
              data?['imageAsset'] as String? ?? ''; // Get the imageAsset

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  imageAsset,
                  height: 200.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ), // Display the hotel image
                const SizedBox(height: 16.0),
                Text(
                  hotelName,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  location,
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Booking Details:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text('Nights: $nights'),
                Text('Adults: $adults'),
                Text('Children: $children'),
                Text('Start Date: $startDate'),
                Text('End Date: $endDate'),

                const SizedBox(height: 16.0),
                Text(
                  'Total Price: \$${totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    // Cancel the booking
                    FirebaseFirestore.instance
                        .collection('bookedHotels')
                        .doc(widget.hotelId)
                        .delete();
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 16.0,
                    ),
                  ),
                  child: const Text(
                    'Cancel Booking',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
