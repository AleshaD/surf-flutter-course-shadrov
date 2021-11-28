import 'package:flutter/material.dart';
import 'package:places/constants/app_colors.dart';
import 'package:places/constants/app_strings.dart';

class EmptyListPage extends StatelessWidget {
  const EmptyListPage({required this.icon, required this.message});

  final IconData icon;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: AppColors.inactiveBlack,
            size: 50,
          ),
          SizedBox(
            height: 32,
          ),
          Text(
            AppStrings.empty,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.inactiveBlack),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.inactiveBlack),
          ),
          SizedBox(
            height: 32,
          )
        ],
      ),
    );
  }
}
