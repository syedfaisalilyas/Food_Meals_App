import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/meal_provider.dart';

enum Filter {
  glutenfree,
  lactosefree,
  vegeterian,
  vegan,
}

class FilterProvider extends StateNotifier<Map<Filter, bool>> {
  FilterProvider()
      : super({
          Filter.glutenfree: false,
          Filter.lactosefree: false,
          Filter.vegan: false,
          Filter.vegeterian: false,
        });
  void setfilters(Map<Filter, bool> choosenfilter) {
    state = choosenfilter;
  }

  void setfilter(Filter filter, bool isactive) {
    state = {...state, filter: isactive};
  }
}

final filterprovider = StateNotifierProvider<FilterProvider, Map<Filter, bool>>(
    (ref) => FilterProvider());

final filteredmealsprovider = Provider((ref) {
  final meals = ref.watch(mealprovider);
  final activefilters = ref.watch(filterprovider);
  return meals.where((meal) {
    if (activefilters[Filter.glutenfree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activefilters[Filter.lactosefree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activefilters[Filter.vegeterian]! && !meal.isVegetarian) {
      return false;
    }
    if (activefilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
