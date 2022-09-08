import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/data/restaurant.dart';

/* 
  restaurantRepositoryProvider ile bir RestaurantRepository nesnesi
  oluşturulur ve bu nesneye uygulamanın her yerinden erişilebilir.
*/
final restaurantRepositoryProvider = Provider((_) => RestaurantRepository());

// restaurantRepositoryProvider'ın içinden restaurantList listesini çağırır.
// Değer değiştiğinde güncelleme yapılması için StateProvider kullanılmalı.
final restaurantListProvider = StateProvider(
  (ref) {
    final restaurantRepository = ref.watch(restaurantRepositoryProvider);
    return restaurantRepository.getRestaurantList();
  },
);

class RestaurantRepository {
  final List<Restaurant> _restaurantList = [
    Restaurant("Çiçek Restoran", 4.5),
    Restaurant("Böcek Restoran", 4.4),
    Restaurant("Nusret", 4.3),
  ];

  List<Restaurant> getRestaurantList() {
    return _restaurantList;
  }

  addNewRestaurant(Restaurant newRestaurant) {
    _restaurantList.add(newRestaurant);
  }
}
