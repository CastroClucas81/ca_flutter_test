import 'package:blue_challenge/generated/l10n.dart';
import 'package:blue_challenge/src/core/design_system/assets/images/ds_image_enum.dart';
import 'package:blue_challenge/src/core/design_system/widgets/buttons/ds_button.dart';
import 'package:flutter/material.dart';

class SomeError extends StatelessWidget {
  final VoidCallback onTryAgain;
  final String description;

  const SomeError({
    required this.onTryAgain,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              DSImageEnum.magikarp.path,
              fit: BoxFit.cover,
              height: 180,
            ),
            const SizedBox(height: 16),
            Text(
              S.of(context).whoops,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            DSButton(
              onPressed: onTryAgain,
              title: S.of(context).tryAgain,
            )
          ],
        ),
      ),
    );
  }
}
