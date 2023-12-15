import 'package:flutter/material.dart';
import 'package:meal_app/models/meals.dart';
import 'package:meal_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class meal_item extends StatelessWidget {
  const meal_item({super.key, required this.meal, required this.selectscreen});
  final Meal meal;
  final void Function(Meal meal) selectscreen;

  String get mealcomplexity {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get mealaffordability {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          selectscreen(meal);
        },
        splashColor: Theme.of(context).primaryColor.withOpacity(0.5),
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                color: Colors.black54,
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Meal_item_trait(
                            icon: Icons.schedule,
                            label: '${meal.duration} min'),
                        const SizedBox(
                          width: 12,
                        ),
                        Meal_item_trait(
                            icon: Icons.work, label: mealcomplexity),
                        const SizedBox(
                          width: 12,
                        ),
                        Meal_item_trait(
                            icon: Icons.attach_money, label: mealaffordability)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
