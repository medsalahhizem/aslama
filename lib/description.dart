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
        'images/catalog/beach.jpg',
        height: 200,
        width: 500,
        fit: BoxFit.cover,
      ),
      const SizedBox(height: 16),
      const Text(
        'Our country is blessed with some of the most breathtaking beaches in the world. From golden sandy shores to secluded coves, our beaches offer something for everyone.',
        style: TextStyle(fontSize: 16),
      ),
      const SizedBox(height: 8),
      const Text(
        'Tunisia boasts a stunning coastline, with its beautiful beaches stretching from the Mediterranean Sea to the Atlantic Ocean. Each beach offers a unique experience, from the tranquil waters of the Gulf of Gabes to the vibrant nightlife of the beachfronts in Sousse and Monastir.',
        style: TextStyle(fontSize: 16),
      ),
      const SizedBox(height: 8),
      const Text(
        "Whether you're looking for a quiet spot to relax or a lively place to party, Tunisia's beaches have something to offer. From the ancient ruins of Carthage to the modern resorts of Hammamet, there's a beach for every mood and preference.",
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
        'images/catalog/cuisine.jpeg',
        height: 200,
        fit: BoxFit.cover,
      ),
      const SizedBox(height: 16),
      const Text(
        'Our culinary scene is a melting pot of flavors and influences from various cultures. From traditional dishes to modern fusion creations, our restaurants offer a delightful dining experience for every palate.',
        style: TextStyle(fontSize: 16),
      ),
      const SizedBox(height: 8),
      const Text(
        "Tunisian cuisine is a blend of Mediterranean, North African, and French influences. From the spicy and aromatic tagines to the fresh seafood dishes, Tunisia's culinary heritage is rich and varied.",
        style: TextStyle(fontSize: 16),
      ),
      const SizedBox(height: 8),
      const Text(
        'Explore the vibrant markets of Tunis, where you can find everything from fresh produce to exotic spices. Or, dine in one of the many renowned restaurants that have earned Tunisia a reputation for its culinary excellence.',
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
     return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'chenenni',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 16),
      Image.asset(
        'images/catalog/chenini.jpg',
        height: 200,
        fit: BoxFit.cover,
      ),
      const SizedBox(height: 16),
      const Text(
        'Journey back in time at Chenini, a ruined Berber village perched on a Tunisian hilltop. ',
        style: TextStyle(fontSize: 16),
      ),
      const SizedBox(height: 8),
      const Text(
        "Explore a maze of troglodyte dwellings, where ancient granaries and a striking white mosque stand watch over the desert landscape.",
        style: TextStyle(fontSize: 16),
      ),
      const SizedBox(height: 8),
      const Text(
        ' Chenini is a unique stop on Tunisia s ksar trail, offering a glimpse into a bygone era and the traditional Berber way of life.  Don t miss this chance to wander through history!',
        style: TextStyle(fontSize: 16),
      ),
      // Add more content for cuisine
    ],
 );
    
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
