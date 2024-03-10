import 'package:LaithStore/core/data/network/network_config.dart';

class CategoryEndpoint {
  static String allCategories = NetworkConfig.getFullApiRoute('categories');
  static String allProducts = NetworkConfig.getFullApiRoute('');
  static String productsByCategory = NetworkConfig.getFullApiRoute('category/');
}
