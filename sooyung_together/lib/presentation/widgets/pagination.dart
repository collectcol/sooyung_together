import 'package:flutter/material.dart';

class CustomPagination extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final Function(int) onPageChanged;
  final int maxVisiblePages = 10;

  const CustomPagination({
    Key? key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int startPage = ((currentPage - 1) ~/ maxVisiblePages) * maxVisiblePages + 1;
    int endPage = startPage + maxVisiblePages - 1;

    if (endPage > totalPages) {
      endPage = totalPages;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 이전 버튼
        if (startPage > 1)
          Container(
            margin: EdgeInsets.only(right: 8),
            child: InkWell(
              onTap: () => onPageChanged(startPage - 1),
              child: Row(
                children: [
                  Icon(
                    Icons.chevron_left,
                    size: 18,
                    color: Colors.grey,
                  ),
                  Text(
                    '이전',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),

        // 페이지 번호 목록
        ...List.generate(endPage - startPage + 1, (index) {
          final pageNumber = startPage + index;
          final isSelected = pageNumber == currentPage;

          return Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            child: InkWell(
              onTap: () => onPageChanged(pageNumber),
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  border: isSelected
                      ? Border.all(color: Colors.blue)
                      : null,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(
                    '$pageNumber',
                    style: TextStyle(
                      color: isSelected ? Colors.blue : Colors.grey,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),

        // 다음 버튼
        if (endPage < totalPages)
          Container(
            margin: EdgeInsets.only(left: 8),
            child: InkWell(
              onTap: () => onPageChanged(endPage + 1),
              child: Row(
                children: [
                  Text(
                    '다음',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    size: 18,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}