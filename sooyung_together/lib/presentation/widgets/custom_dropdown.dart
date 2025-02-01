import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatefulWidget {
  final List<T> items;                    // 드롭다운에 표시할 항목 리스트
  final T initialValue;                   // 초기 선택 값
  final Function(T) onChanged;            // 선택 변경 시 콜백
  final String Function(T) displayName;   // 항목을 표시할 방법을 정의하는 함수

  const CustomDropdown({
    super.key,
    required this.items,
    required this.initialValue,
    required this.onChanged,
    required this.displayName,
  });

  @override
  State<CustomDropdown<T>> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  late T _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  // 부모로부터 받은 값이 변경될 때 호출되는 메서드
  @override
  void didUpdateWidget(covariant CustomDropdown<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    // initialValue 가 변경되었고, 현재 선택된 값과 다르다면 업데이트
    if (widget.initialValue != oldWidget.initialValue &&
    widget.initialValue != _selectedValue) {
      setState(() {
        _selectedValue = widget.initialValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          child: DropdownButton<T>(
            value: _selectedValue,
            items: widget.items
                .map(
                  (item) => DropdownMenuItem(
                value: item,
                child: Text(widget.displayName(item)),
              ),
            )
                .toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _selectedValue = value;
                });
                widget.onChanged(value);
              }
            },
            style: TextStyle(
              color: Colors.black87,
              fontSize: 15,
            ),
            icon: Icon(Icons.arrow_drop_down),
            isDense: false,
            padding: EdgeInsets.symmetric(horizontal: 8.0),
          ),
        ),
      ),
    );
  }
}
