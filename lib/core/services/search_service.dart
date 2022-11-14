import 'package:algolia/algolia.dart';

import '../utils/environment/environment.dart';

class SearchService {
  final Algolia _algolia = Algolia.init(
    applicationId: Environment.applicationId,
    apiKey: Environment.apiKey,
  );

  Future<List<AlgoliaObjectSnapshot>> getProducts(String searchTerm) async {
    final snapshot = await _algolia.instance.index('products').query(searchTerm).getObjects();

    return snapshot.hits;
  }
}
