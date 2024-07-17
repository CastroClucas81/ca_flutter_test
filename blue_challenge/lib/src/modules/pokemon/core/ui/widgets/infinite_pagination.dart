import 'package:blue_challenge/generated/l10n.dart';
import 'package:blue_challenge/src/core/design_system/colors/ds_colors.dart';
import 'package:blue_challenge/src/core/failures/failures.dart';
import 'package:blue_challenge/src/core/widgets/not_found.dart';
import 'package:blue_challenge/src/core/widgets/some_error.dart';
import 'package:blue_challenge/src/modules/pokemon/core/ui/widgets/no_more_data.dart';
import 'package:blue_challenge/src/modules/pokemon/core/ui/widgets/skeletons/pokemon_card_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class InfinitePagination<T> extends StatefulWidget {
  final PagingController<int, T> controller;
  final Widget Function(BuildContext, T, int) itemBuilder;

  const InfinitePagination({
    required this.controller,
    required this.itemBuilder,
    super.key,
  });

  @override
  State<InfinitePagination<T>> createState() => _InfinitePaginationState<T>();
}

class _InfinitePaginationState<T> extends State<InfinitePagination<T>> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => widget.controller.refresh(),
      color: DSColors.blue,
      child: PagedListView<int, T>(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollController: scrollController,
        pagingController: widget.controller,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 16,
        ),
        builderDelegate: PagedChildBuilderDelegate<T>(
          noMoreItemsIndicatorBuilder: (context) => NoMoreData(
            animateToTop: () {
              scrollController.animateTo(
                0.0,
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 1700),
              );
            },
          ),
          firstPageErrorIndicatorBuilder: (context) => SomeError(
            onTryAgain: widget.controller.refresh,
            description: widget.controller.error is ConnectionFailure
                ? S.of(context).noInternetConnectionWasFound
                : S.of(context).anErrorOcurredPleaseTryAgain,
          ),
          firstPageProgressIndicatorBuilder: (context) => Column(
            children: List.generate(
              4,
              (index) => const PokemonCardSkeleton(),
            ),
          ),
          noItemsFoundIndicatorBuilder: (context) => NotFound(
            title: S.of(context).noResultsFound,
            description: S.of(context).weCouldFindAnyMatchingResults,
          ),
          newPageProgressIndicatorBuilder: (context) =>
              const PokemonCardSkeleton(),
          itemBuilder: widget.itemBuilder,
        ),
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
