import 'package:flutter/material.dart';
import 'package:meal_app/models/meals.dart';
import 'package:meal_app/widgets/meal_item.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });

  final String? title;
  final List<Meal> meals;

  void _onselectmealscreen(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => Meal_detail_screen(
              meal: meal,
            )));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh...nothing here...',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Try selecting a different category',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          )
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => meal_item(
          meal: meals[index],
          selectscreen: (meal) {
            _onselectmealscreen(context, meal);
          },
        ),
      );
    }
    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
