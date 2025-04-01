import 'package:ecomerce/app/urls.dart';
import 'package:ecomerce/features/common/data/model/category_pagination_model.dart';
import 'package:ecomerce/services/network_caller/network_caller.dart';
import 'package:get/get.dart';

class CategoryListController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  CategoryPaginationModel? _categoryPaginationModel;

  List<CategoryItemModel> get categoryList =>
      _categoryPaginationModel?.data?.results ?? [];

  int _count = 5;
  int _page = 1;

  Future<bool> getCategoryList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    Map<String, dynamic> queryParams = {'count': _count, 'page': _page};

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(Urls.categoriesUrl, queryParams: queryParams);

    if (response.isSuccess) {
      _categoryPaginationModel = CategoryPaginationModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}

/// TODO : 1 H 17 M
