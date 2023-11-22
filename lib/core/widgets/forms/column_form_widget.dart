import 'package:employee_app/core/config/app_typography.dart';
import 'package:flutter/material.dart';

class ColumnFormWidget extends StatelessWidget {
  final String title;
  final Widget item;

  const ColumnFormWidget({
    Key? key,
    required this.title,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 12),
        item,
        const SizedBox(height: 16),
      ],
    );
  }
}
