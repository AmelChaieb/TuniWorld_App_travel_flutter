import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../models/Restaurant.dart';
import 'RestaurantDetailsScreen .dart';
import '../widgets/custom_header.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  static const routeName = '/restaurants';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    List<Restaurant> restaurants = Restaurant.restaurants;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          const CustomHeader(title: 'Restaurants'),
          _RestaurantsMasonryGrid(
            width: width,
            restaurants: restaurants,
          ),
        ],
      ),
    );
  }
}

class _RestaurantsMasonryGrid extends StatelessWidget {
  const _RestaurantsMasonryGrid({
    Key? key,
    this.masonryCardHeights = const [200, 250, 300],
    required this.width,
    required this.restaurants,
  }) : super(key: key);

  final List<double> masonryCardHeights;
  final double width;
  final List<Restaurant> restaurants;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(10.0),
      itemCount: 9,
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      itemBuilder: (context, index) {
        Restaurant restaurant = restaurants[index];
        return _buildRestaurantCard(
          context,
          restaurant,
          index,
        );
      },
    );
  }

  InkWell _buildRestaurantCard(
    BuildContext context,
    Restaurant restaurant,
    int index,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RestaurantDetailsScreen(restaurant: restaurant),
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: '${restaurant.id}_${restaurant.name}',
            child: Container(
              height: masonryCardHeights[index % 3],
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: NetworkImage(restaurant.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            restaurant.name,
            maxLines: 3,
            style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
