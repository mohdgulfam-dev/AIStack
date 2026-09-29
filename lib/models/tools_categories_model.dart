import 'package:aistack/models/ai_tool.dart';

class ToolsCategoriesModel {
  const ToolsCategoriesModel({
    required this.category,
    required this.iconPath,
    required this.toolCount,
    required this.description,
  });
  final AiCategory category;
  final String iconPath;
  final int toolCount;
  final String description;
}
