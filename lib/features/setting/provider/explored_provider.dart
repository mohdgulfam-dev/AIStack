import 'package:aistack/data/repositories/eplored_repository.dart';
import 'package:aistack/models/ai_tool.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ExploredNotifier extends AsyncNotifier<int> {
  @override
  Future<int> build() async {
    final counter = await ExploredRepository.getExplored();
    return counter;
  }

  void addExplored(AiTool tool) async {
   await  ExploredRepository.explored(tool);
    final counter = await ExploredRepository.getExplored();
    state = AsyncData(counter);
  }
}

final exploredProvider = AsyncNotifierProvider<ExploredNotifier, int>(
  ExploredNotifier.new,
);
