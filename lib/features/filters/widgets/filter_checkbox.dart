import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class FilterCheckbox extends StatelessWidget {
  const FilterCheckbox({
    super.key,
    required this.isSelected,

  });
  final bool isSelected;


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return  AnimatedContainer(
        duration: const  Duration(milliseconds: 150),
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          borderRadius:   BorderRadius.circular(4),
          color: isSelected ? theme.colorScheme.primary : Colors.transparent,
          border: BoxBorder.all(color: theme.colorScheme.outline),
        ),
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 150),
            child: isSelected
                ? Icon(
                    key: ValueKey(true),
                    size: 15,
                    LucideIcons.check,
                    color: theme.colorScheme.onPrimary,
                  )
                : const SizedBox.shrink(key: ValueKey(false)),
          ),
        ),
     
    );
  }
}
