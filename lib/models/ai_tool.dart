enum PricingType { free, freemium, paid, all}



enum AiCategory {
  chat,
  coding,
  writing,
  research,
  imgGen,
  vidGen,
  vidEditing,
  audio,
  design,
  presentations,
  dataAnalytics,
  automation,
  threeDGen,
  
}

class AiTool {
  const AiTool({
    required this.id,
    required this.name,
    required this.description,
    
    required this.websiteUrl,
    required this.pricingType,
  
    required this.companyName,
    required this.hasMobileApp,
    required this.categories,
    required this.rating,
    required this.popularity,
    required this.iconPath,
  });
  final String iconPath;
  final String id;
  final String name;
  final String companyName;
  final String description;

  final String websiteUrl;


  final PricingType pricingType;

  final bool hasMobileApp;

  final List<AiCategory> categories;

  final double rating;
  final int popularity;
}
