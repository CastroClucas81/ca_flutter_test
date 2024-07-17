import 'package:blue_challenge/generated/l10n.dart';
import 'package:flutter/material.dart';

class NoMoreData extends StatelessWidget {
  final VoidCallback animateToTop;

  const NoMoreData({required this.animateToTop, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: animateToTop,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.arrow_upward,
            ),
            const SizedBox(width: 5),
            Text(
              S.of(context).noMoreData,
              style: const TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
