import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/favourite_provider.dart';
import 'package:meal_app/screens/category_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meal_screen.dart';
import 'package:meal_app/widgets/maindrawer.dart';
import 'package:meal_app/providers/filter_provider.dart';

const kinitialfilters = {
  Filter.glutenfree: false,
  Filter.lactosefree: false,
  Filter.vegeterian: false,
  Filter.vegan: false,
};

class Tabs_screen extends ConsumerStatefulWidget {
  const Tabs_screen({
    super.key,
  });
  @override
  ConsumerState<Tabs_screen> createState() {
    return _tabscreenstate();
  }
}

class _tabscreenstate extends ConsumerState<Tabs_screen> {
  int currentpageindex = 0;

  void _onselectscreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
          MaterialPageRoute(builder: (ctx) => const FilterScreen()));
    }
  }

  void _selectpageindex(int index) {
    setState(() {
      currentpageindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final availablemeals = ref.watch(filteredmealsprovider);
    var activepagetitle = 'Categories';
    Widget activepagescreen = CategoryScreen(
      availablemeals: availablemeals,
    );
    if (currentpageindex == 1) {
      final favouritemeal = ref.watch(favouritemealprovider);
      activepagescreen = MealsScreen(
        meals: favouritemeal,
      );
      activepagetitle = 'Favourites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activepagetitle),
      ),
      drawer: Maindrawer(
        onselectscreen: _onselectscreen,
      ),
      body: activepagescreen,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectpageindex,
          currentIndex: currentpageindex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: 'Categories'),
            BottomNavigationBarItem(
                icon: Icon(Icons.star), label: 'Favourites'),
          ]),
    );
  }
}
