import 'package:aistack/models/ai_tool.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

const Map<AiCategory, IconData> profileCategoryIcons = {
  AiCategory.chat: LucideIcons.messageCircleMore,
  AiCategory.coding: LucideIcons.codeXml,
  AiCategory.writing: LucideIcons.pencil,
  AiCategory.research: LucideIcons.search,
  AiCategory.imgGen: LucideIcons.image,
  AiCategory.vidGen: LucideIcons.clapperboard,
  AiCategory.vidEditing: LucideIcons.scissors,
  AiCategory.audio: LucideIcons.audioLines,
  AiCategory.design: LucideIcons.palette,
  AiCategory.presentations: LucideIcons.presentation,
  AiCategory.dataAnalytics: LucideIcons.chartColumn,
  AiCategory.automation: LucideIcons.bot,
  AiCategory.threeDGen: LucideIcons.box,
  
};
