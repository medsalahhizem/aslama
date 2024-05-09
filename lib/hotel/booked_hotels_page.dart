import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'booked_hotel_details.dart';

class BookedHotelsPage extends StatefulWidget {
  const BookedHotelsPage({Key? key}) : super(key: key);

  @override
  _BookedHotelsPageState createState() => _BookedHotelsPageState();
}

class _BookedHotelsPageState extends State<BookedHotelsPage> {
  final Stream<QuerySnapshot> _bookedHotelsStream = FirebaseFirestore.instance
      .collection('bookedHotels')
      .where('userId', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booked Hotels'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _bookedHotelsStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong'),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final bookedHotels = snapshot.data!.docs;

          if (bookedHotels.isEmpty) {
            return const Center(
              child: Text('No booked hotels'),
            );
          }

          return ListView.builder(
            itemCount: bookedHotels.length,
            itemBuilder: (context, index) {
              final hotelData =
                  bookedHotels[index].data() as Map<String, dynamic>;
              final hotelName = hotelData['hotelName'] as String;
              final hotelId = bookedHotels[index].id;

              return ListTile(
                title: Text(hotelName),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          BookedHotelDetailsPage(hotelId: hotelId),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
