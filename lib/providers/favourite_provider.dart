import 'package:meal_app/models/meals.dart';
import 'package:riverpod/riverpod.dart';

class FavouriteMealPorvider extends StateNotifier<List<Meal>> {
  FavouriteMealPorvider() : super([]);

  bool togglemealfavouritestatus(Meal meal) {
    final isfavmeal = state.contains(meal);
    if (isfavmeal) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favouritemealprovider =
    StateNotifierProvider<FavouriteMealPorvider, List<Meal>>((ref) {
  return FavouriteMealPorvider();
});
