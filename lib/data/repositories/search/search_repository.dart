import '../../../core/services/search_service.dart';
import '../../models/product/product_model.dart';
import 'base_search_repository.dart';

class SearchRepository implements BaseSearchRepository {
  final SearchService searchService;

  SearchRepository({required this.searchService});

  @override
  Future<List<ProductModel>> getProducts(String searchTerm) async {
    final result = await searchService.getProducts(searchTerm);
    return result.map((e) => e.data).map((e) => ProductModel.fromJson(e)).toList();
  }
}
