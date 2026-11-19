import 'package:aistack/data/ai_tool_data.dart';
import 'package:aistack/data/repositories/favorite_repository.dart';
import 'package:aistack/models/ai_tool.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddFavoriteProviderClass extends AsyncNotifier<List<AiTool>> {
  @override
  Future<List<AiTool>> build() async {
    final savedIds = await FavoriteRepository.getFavoriteIds();
    return aiToolsData.where((item) => savedIds.contains(item.id)).toList();
  }

  Future<void> manageFavorite(AiTool aiTool, BuildContext context) async {
    List<AiTool> favorites = state.value ?? [];
    final isFavorite = favorites.any((tool) => tool.id == aiTool.id);
    if (isFavorite) {
      favorites = favorites.where((item) => item.id != aiTool.id).toList();
    } else if (favorites.length >= 20) {
      favorites.removeAt(19);
      favorites.insert(0, aiTool);
    } else {
      favorites = [aiTool, ...favorites];
    }
    state = AsyncData(favorites);
    Future<void> persist(List<AiTool> favorites) async {
      final ids = favorites.map((item) => item.id).toList();
      await FavoriteRepository.setFavoriteIds(ids);
    }

    await persist(favorites);

    if (!context.mounted) return;

    final messenger = ScaffoldMessenger.of(context);
    messenger.clearSnackBars();
    final snackBarController = messenger.showSnackBar(
      SnackBar(
        content: Text(
          isFavorite
              ? "${aiTool.name} removed from favorites"
              : "${aiTool.name} added to favorites",
        ),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () async {
            if (isFavorite) {
              favorites = [aiTool, ...favorites];
            } else {
              favorites = favorites
                  .where((item) => item.id != aiTool.id)
                  .toList();
            }
            state = AsyncData(favorites);
            await persist(favorites);
          },
        ),
      ),
    );

    Future<void>.delayed(const Duration(seconds: 2), snackBarController.close);
  }
}

final manageFavoriteProvider =
    AsyncNotifierProvider<AddFavoriteProviderClass, List<AiTool>>(
      AddFavoriteProviderClass.new,
    );
