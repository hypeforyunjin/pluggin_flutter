import 'package:flutter/material.dart';

typedef FilterCallback = void Function(Color);

class FilterSelector extends StatelessWidget {
  final FilterCallback onFilterChanged;
  final List<Color> filters;

  const FilterSelector({
    Key? key,
    required this.onFilterChanged,
    required this.filters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.black.withOpacity(0.7),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        itemBuilder: (context, index) {
          final filterColor = filters[index];
          return GestureDetector(
            onTap: () => onFilterChanged(filterColor),
            child: Container(
              width: 80,
              color: filterColor,
              margin: const EdgeInsets.all(4.0),
            ),
          );
        },
      ),
    );
  }
}
