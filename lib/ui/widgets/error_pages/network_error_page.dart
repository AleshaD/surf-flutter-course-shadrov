import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/styles/custom_icons.dart';
import 'package:places/ui/screen/visiting_screen/widgets/empty_list_page.dart';

class NetworkErrorPage extends EmptyListPage {
  NetworkErrorPage({
    Key? key,
    required this.onReloadPressed,
    required String msgForUser,
  }) : super(
          icon: CustomIcons.delete,
          titleMessage: AppStrings.erorr,
          bodyMessage: msgForUser,
        );

  final VoidCallback onReloadPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 108,
        ),
        super.build(context),
        SizedBox(
          height: 54,
        ),
        TextButton(
          onPressed: onReloadPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              AppStrings.reload,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onSurface,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
