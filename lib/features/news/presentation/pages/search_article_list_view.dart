part of '_pages.dart';

class SearchArticleListView extends StatefulWidget {
  const SearchArticleListView({
    Key? key,
    this.stringQuery,
    required this.callback,
  }) : super(key: key);

  final String? stringQuery;
  final VoidCallback callback;

  @override
  _SearchArticleListViewState createState() => _SearchArticleListViewState();
}

class _SearchArticleListViewState
    extends BasePaginationState<SearchArticleListView> {
  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return null;
  }

  @override
  ScaffoldAttribute buildAttribute() {
    final theme = context.theme;
    return ScaffoldAttribute(
      backgroundColor: theme.backgroundColor,
    );
  }

  @override
  Widget buildNarrowLayout(BuildContext context, SizingInformation sizeInfo) {
    return RefreshIndicator(
      key: refreshIndicatorKey,
      onRefresh: () async => widget.callback.call(),
      child: BlocBuilder<SearchArticleBloc, SearchArticleState>(
        builder: (context, state) {
          if (state is SearchArticleInitial) {
            widget.callback.call();
          }
          if (state is SearchArticleLoading) {
            return const CircleLoading();
          }
          if (state is SearchArticleError) {
            return ListView(
              children: [
                HeightSize(sizeInfo.screenSize.height * .1),
                GlobalIcon.svg(
                  'fi_search',
                  height: 40,
                  width: 40,
                ),
                const HeightSize(10),
                Center(
                  child: Text(
                    state.failure.message ?? 'Something error',
                    style: FontTheme.rubik16w500black1(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            );
          }
          if (state is SearchArticleSuccess) {
            final length = state.length;
            if (length == 0) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HeightSize(sizeInfo.screenSize.height * .1),
                  SvgPicture.asset(
                    'assets/icons/fi_search.svg',
                    height: 40,
                    width: 40,
                  ),
                  const HeightSize(10),
                  Center(
                    child: Text(
                      '''
Cannot found ${widget.stringQuery}''',
                      style: FontTheme.rubik16w500black1(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              );
            }
            return ListView.separated(
              controller: scrollController,
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 20,
              ),
              itemBuilder: (c, i) {
                if (!state.hasReachedMax && i == length) {
                  return const CircleLoading();
                }
                final article = state.articles![i];
                return NewsCard(
                  article: article,
                  onTap: () => nav.goToArticleDetail(article),
                );
              },
              separatorBuilder: (_, __) => const SizedBox(
                height: 10,
              ),
              itemCount: state.hasReachedMax ? length : length + 1,
            );
          }
          return Container();
        },
      ),
    );
  }

  @override
  Widget buildWideLayout(BuildContext context, SizingInformation sizeInfo) {
    return buildNarrowLayout(context, sizeInfo);
  }

  @override
  void init() {}

  @override
  Future<bool> onBackPressed() async {
    return true;
  }

  @override
  void onScroll() {
    context.read<SearchArticleBloc>()
      ..isFetching = true
      ..add(
        SearchMoreArticle(),
      );
  }

  @override
  bool scrollCondition() {
    return !context.read<SearchArticleBloc>().isFetching &&
        !context.read<SearchArticleBloc>().hasReachedMax;
  }
}
