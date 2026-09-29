import 'package:aistack/models/ai_tool.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

const Map<PricingType, IconData> profilePricingMap = {
  PricingType.free: LucideIcons.badgeCheck,
  PricingType.freemium: LucideIcons.badgeDollarSign,
  PricingType.paid: LucideIcons.wallet,
};
