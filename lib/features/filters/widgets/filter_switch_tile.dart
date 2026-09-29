import 'package:flutter/material.dart';

class FilterSwitchTile extends StatelessWidget {
  const FilterSwitchTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text('Filter'),
      value: false,
      onChanged: (_) {},
    );
  }
}
