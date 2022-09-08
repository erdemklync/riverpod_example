import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/data/restaurant.dart';
import 'package:riverpod_example/repository/restaurant_repository.dart';
import 'package:riverpod_example/view/home/home_view_model.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restoran Listesi'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(homeViewModelProvider).addNewRestaurant();
        },
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final restaurantList = ref.watch(restaurantListProvider);
          return ListView.builder(
            itemCount: restaurantList.length,
            itemBuilder: (context, index) {
              Restaurant restaurant = restaurantList[index];

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(restaurant.name),
                  Text(restaurant.rating.toString()),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
