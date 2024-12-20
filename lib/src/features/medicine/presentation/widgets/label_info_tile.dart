import 'package:flutter/material.dart';
import 'package:pill_alert/src/core/app_constants.dart/app_colors.dart';

class LabelInfoTile extends StatelessWidget {
  final String label;
  final String info;
  const LabelInfoTile({
    required this.label,
    required this.info,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 4,
              backgroundColor: AppColors.secondary,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: AppColors.primary),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 16),
          child: Text(info,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: AppColors.primary)),
        ),
      ],
    );
  }
}
