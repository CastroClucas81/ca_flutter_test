import 'package:blue_challenge/src/core/design_system/colors/ds_colors.dart';
import 'package:blue_challenge/src/core/design_system/utils/enums/ds_notification_type_enum.dart';
import 'package:flutter/material.dart';

class DSSnackBar {
  static void show(
    BuildContext context, {
    required String message,
    DSNotificationTypeEnum type = DSNotificationTypeEnum.success,
  }) {
    final backgroundColor = switch (type) {
      DSNotificationTypeEnum.success => DSColors.green,
      DSNotificationTypeEnum.error => DSColors.red,
    };

    final snackBar = SnackBar(
      backgroundColor: backgroundColor,
      content: Text(message),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
