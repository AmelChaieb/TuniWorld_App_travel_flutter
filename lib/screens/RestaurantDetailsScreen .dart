import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/clipped_container.dart'; // Assurez-vous que ce widget est défini quelque part dans votre projet
import '../models/Restaurant.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  const RestaurantDetailsScreen({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: Column(
        children: [
          _RestaurantImage(restaurant: restaurant),
          _RestaurantInformation(restaurant: restaurant),
        ],
      ),
    );
  }
}

class _RestaurantImage extends StatelessWidget {
  const _RestaurantImage({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ClippedContainer(height: 425), // Assurez-vous que cette hauteur correspond à vos besoins
        Hero(
          tag: '${restaurant.id}_${restaurant.name}',
          child: ClippedContainer(imageUrl: restaurant.imageUrl),
        ),
      ],
    );
  }
}

class _RestaurantInformation extends StatelessWidget {
  const _RestaurantInformation({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              restaurant.name,
              style: Theme.of(context)
                 .textTheme
                 .headlineSmall!
                 .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              restaurant.description,
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () async {

                    final long = restaurant.lng;
                    final lati = restaurant.lat;
                    final url = 'https://www.google.com/maps/search/?api=1&query=$lati,$long';
                    if (await canLaunch(url)) {
                    await launch(url);
                    } else {
                    throw 'Could not launch $url';
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 86, 126, 206),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  child: Text(
                    'Discover Now',
                    style: Theme.of(context)
                       .textTheme
                       .bodyLarge!
                       .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
