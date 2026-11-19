import 'package:material_ui/material_ui.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Icon(
        Icons.star,
        size: 17,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
