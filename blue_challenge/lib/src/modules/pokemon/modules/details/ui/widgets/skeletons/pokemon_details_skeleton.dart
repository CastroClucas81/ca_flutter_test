import 'package:blue_challenge/src/core/widgets/skeleton_item.dart';
import 'package:flutter/material.dart';

class PokemonDetailsSkeleton extends StatelessWidget {
  const PokemonDetailsSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SkeletonItem(
            width: double.infinity,
            height: 150,
          ),
          const SizedBox(height: 16),
          SkeletonItem(
            width: MediaQuery.of(context).size.width * 0.2,
            height: 30,
          ),
          const SizedBox(height: 10),
          SkeletonItem(
            width: MediaQuery.of(context).size.width * 0.5,
            height: 40,
          ),
          const SizedBox(height: 26),
          const Row(
            children: [
              SkeletonItem(
                width: 100,
                height: 40,
                borderRadius: 40,
              ),
              SizedBox(width: 8),
              SkeletonItem(
                width: 100,
                height: 40,
                borderRadius: 40,
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          const SkeletonItem(
            width: double.infinity,
            height: 80,
          ),
          const SizedBox(height: 26),
          const Row(
            children: [
              Flexible(
                child: SkeletonItem(
                  width: double.infinity,
                  height: 40,
                ),
              ),
              SizedBox(width: 8),
              Flexible(
                child: SkeletonItem(
                  width: double.infinity,
                  height: 40,
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          const Row(
            children: [
              Flexible(
                child: SkeletonItem(
                  width: double.infinity,
                  height: 40,
                ),
              ),
              SizedBox(width: 12),
              Flexible(
                child: SkeletonItem(
                  width: double.infinity,
                  height: 40,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
