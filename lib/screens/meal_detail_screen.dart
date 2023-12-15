import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meals.dart';
import 'package:meal_app/providers/favourite_provider.dart';

class Meal_detail_screen extends ConsumerWidget {
  const Meal_detail_screen({
    super.key,
    required this.meal,
  });

  final Meal meal;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouritemeals = ref.watch(favouritemealprovider);
    final isfavourite = favouritemeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final status = ref
                  .read(favouritemealprovider.notifier)
                  .togglemealfavouritestatus(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(status
                      ? 'Meal added as a favourite'
                      : 'Meal removed successfully'),
                ),
              );
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: Tween(begin: 0.9, end: 1.0).animate(animation),
                  child: child,
                );
              },
              child: Icon(
                isfavourite ? Icons.star : Icons.star_border,
                key: ValueKey(isfavourite),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.id,
              child: Image.network(
                meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            for (final i in meal.ingredients)
              Text(
                i,
                style: const TextStyle(color: Colors.white),
              ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            for (final i in meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Text(
                  '${((meal.steps.indexOf(i)).toInt() + 1).toString()} -$i',
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
