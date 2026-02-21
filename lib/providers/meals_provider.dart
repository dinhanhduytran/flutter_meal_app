import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app_flutter/data/dummy_data.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
