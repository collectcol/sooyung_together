import '../constants/per_page.dart';

class PaginationState {
  int currentPage = 1;
  int perPage = 10;
  int totalCount = 0;

  int get totalPages => (totalCount / perPage).ceil();

  PerPage getCurrentPerPage() {
    return PerPage.values.firstWhere(
          (element) => element.valueToNumber == perPage,
      orElse: () => PerPage.values.first,
    );
  }
}