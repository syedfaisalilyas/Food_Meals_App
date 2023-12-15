import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/filter_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activefilters = ref.watch(filterprovider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: activefilters[Filter.glutenfree]!,
            onChanged: (ischecked) {
              ref
                  .read(filterprovider.notifier)
                  .setfilter(Filter.glutenfree, ischecked);
            },
            title: Text(
              'Glutan-free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text('Only include Glutan-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activefilters[Filter.lactosefree]!,
            onChanged: (ischecked) {
              ref
                  .read(filterprovider.notifier)
                  .setfilter(Filter.lactosefree, ischecked);
            },
            title: Text(
              'Lactose-free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text('Only include Lactose-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activefilters[Filter.vegeterian]!,
            onChanged: (ischecked) {
              ref
                  .read(filterprovider.notifier)
                  .setfilter(Filter.vegeterian, ischecked);
            },
            title: Text(
              'Vegeterian-free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text('Only include Vegeterian-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activefilters[Filter.vegan]!,
            onChanged: (ischecked) {
              ref
                  .read(filterprovider.notifier)
                  .setfilter(Filter.vegan, ischecked);
            },
            title: Text(
              'Vegan-free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text('Only include Vegan-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}
