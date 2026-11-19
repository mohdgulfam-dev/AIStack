import 'package:material_ui/material_ui.dart';

class SearchListTile extends StatelessWidget {
  const SearchListTile({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(name));
  }
}
