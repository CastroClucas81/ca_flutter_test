import 'package:blue_challenge/src/core/design_system/colors/ds_colors.dart';
import 'package:flutter/material.dart';

class DSButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final IconData? icon;
  final bool isLoading;

  const DSButton({
    required this.onPressed,
    required this.title,
    this.icon,
    this.isLoading = false,
    super.key,
  });

  bool get _isIcon => icon != null;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: DSColors.blue,
        padding: const EdgeInsets.all(16),
        elevation: 0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isLoading
              ? const SizedBox(
                  height: 15,
                  width: 15,
                )
              : const SizedBox(),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_isIcon)
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(
                      icon,
                      size: 20,
                      color: DSColors.white,
                    ),
                  ),
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: DSColors.white),
                ),
              ],
            ),
          ),
          if (isLoading)
            const SizedBox(
              height: 15,
              width: 15,
              child: CircularProgressIndicator(
                strokeAlign: 2,
                strokeWidth: 3,
                color: DSColors.white,
              ),
            ),
        ],
      ),
    );
  }
}
