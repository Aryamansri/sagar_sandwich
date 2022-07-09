import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sagar_sandwichss/models/allproduct.dart';

import '../services/User_services.dart';

final userDataProvider = FutureProvider<List<Product>>((ref) async {
  return ref.read(apiProvider).getUser();
});
