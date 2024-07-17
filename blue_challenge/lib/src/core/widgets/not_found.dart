import 'package:blue_challenge/src/core/design_system/assets/images/ds_image_enum.dart';
import 'package:flutter/widgets.dart';

class NotFound extends StatelessWidget {
  final String title;
  final String description;

  const NotFound({
    required this.title,
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
              title,
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
          ],
        ),
      ),
    );
  }
}
