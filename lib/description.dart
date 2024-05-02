import 'package:flutter/material.dart';

class DescriptionPage extends StatelessWidget {
  final String title;

  const DescriptionPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title == 'Beach') _buildBeachDescription(),
              if (title == 'Cuisine') _buildCuisineDescription(),
              if (title == 'Hiking') _buildHikingDescription(),
              if (title == 'Ice') _buildIceDescription(),
              if (title == 'Desert') _buildDesertDescription(),
              if (title == 'Old Cities') _buildOldCitiesDescription(),
              if (title == 'Historical Places')
                _buildHistoricalPlacesDescription(),
              if (title == 'River') _buildRiverDescription(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBeachDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Explore Pristine Beaches',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Image.asset(
          'images/beach.jpg',
          height: 200,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 16),
        const Text(
          'Our country is blessed with some of the most breathtaking beaches in the world. From golden sandy shores to secluded coves, our beaches offer something for everyone.',
          style: TextStyle(fontSize: 16),
        ),
        // Add more content for beaches
      ],
    );
  }

  Widget _buildCuisineDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Savor the Flavors of Our Diverse Cuisine',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Image.asset(
          'images/cuisine.jpg',
          height: 200,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 16),
        const Text(
          'Our culinary scene is a melting pot of flavors and influences from various cultures. From traditional dishes to modern fusion creations, our restaurants offer a delightful dining experience for every palate.',
          style: TextStyle(fontSize: 16),
        ),
        // Add more content for cuisine
      ],
    );
  }

  // Add methods for other descriptions (_buildHikingDescription, _buildIceDescription, etc.)

  Widget _buildHikingDescription() {
    // Implement hiking description
    return Column();
  }

  Widget _buildIceDescription() {
    // Implement ice description
    return Column();
  }

  Widget _buildDesertDescription() {
    // Implement desert description
    return Column();
  }

  Widget _buildOldCitiesDescription() {
    // Implement old cities description
    return Column();
  }

  Widget _buildHistoricalPlacesDescription() {
    // Implement historical places description
    return Column();
  }

  Widget _buildRiverDescription() {
    // Implement river description
    return Column();
  }
}
