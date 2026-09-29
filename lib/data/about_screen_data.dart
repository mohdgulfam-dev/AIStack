import 'package:aistack/models/about_screen_tile.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

const List<AboutScreenTileModel> aboutScreenData = [
  AboutScreenTileModel(
    iconData: LucideIcons.circleHelp,
    title: 'Why I built AIStack',
    subtitle:
        'AI is growing fast, and finding the right tool among so many options can be overwhelming.',
  ),
  AboutScreenTileModel(
    iconData: LucideIcons.usersRound,
    title: 'What AIStack does',
    subtitle:
        'AIStack brings top AI tools together so you can explore, compare, and choose the best one.',
  ),
  AboutScreenTileModel(
    iconData: LucideIcons.funnel,
    title: 'How it helps you',
    subtitle:
        'Browse by category and use filters to quickly find the AI tool that fits your needs.',
  ),
];
