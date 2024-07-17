import 'package:blue_challenge/src/core/design_system/colors/ds_colors.dart';
import 'package:blue_challenge/src/core/widgets/skeleton_item.dart';
import 'package:flutter/material.dart';

class PokemonCardSkeleton extends StatelessWidget {
  const PokemonCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: DSColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SkeletonItem(
            width: 100,
            height: 20,
          ),
          SizedBox(height: 16),
          SkeletonItem(
            width: double.infinity,
            height: 40,
          ),
          SizedBox(height: 16),
          Row(
            children: [
              SkeletonItem(
                width: 100,
                height: 40,
                borderRadius: 40,
              ),
              SizedBox(width: 4),
              SkeletonItem(
                width: 100,
                height: 40,
                borderRadius: 40,
              ),
            ],
          )
        ],
      ),
    );
  }
}
