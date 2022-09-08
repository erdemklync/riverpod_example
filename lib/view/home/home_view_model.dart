import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/data/restaurant.dart';
import 'package:riverpod_example/repository/restaurant_repository.dart';

final homeViewModelProvider = Provider(
  (ref) {
    final restaurantRepository = ref.watch(restaurantRepositoryProvider);
    return HomeViewModel(
      ref: ref,
      restaurantRepository: restaurantRepository,
    );
  },
);

class HomeViewModel {
  final ProviderRef ref;
  final RestaurantRepository restaurantRepository;

  HomeViewModel({
    required this.ref,
    required this.restaurantRepository,
  });

  addNewRestaurant() {
    restaurantRepository.addNewRestaurant(
      Restaurant("Melek Restoran", 4.2),
    );
    ref.refresh(restaurantListProvider);
  }
}
