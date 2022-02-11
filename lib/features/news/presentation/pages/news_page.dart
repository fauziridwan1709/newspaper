part of '_pages.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends BaseStateful<NewsPage> {
  final searchController = TextEditingController();

  String? _lastStringQ;
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  Future<void> _search(String val) async {
    _lastStringQ = val;
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    context.read<SearchArticleBloc>().hasReachedMax = false;
    _debounce = Timer(const Duration(milliseconds: 800), () {
      final initialQ = QuerySearchArticle(q: val);
      context.read<SearchArticleBloc>().add(
            SearchArticle(
              querySearch: initialQ,
            ),
          );
    });
  }

  Future<void> _onSearch(String val) async {
    if (_lastStringQ == val) {
      return;
    }
    await _search(val);
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    final l10n = context.l10n;
    final theme = context.theme;
    return BaseAppBar(
      title: l10n.appName,
      titleStyle: FontTheme.rubik14w500black1().copyWith(
        fontSize: 18,
        color: theme.cardColor,
      ),
      centerTitle: false,
      backgroundColor: theme.backgroundColor,
      actions: [
        BlocBuilder<LocaleCubit, Locale>(
          builder: (_, locale) {
            return Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => context.read<LocaleCubit>().toggleLocale(),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        locale.languageCode.toUpperCase(),
                        style: FontTheme.rubik16w500black1(),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        const WidthSize(12),
        BlocBuilder<ThemeCubit, ThemeData>(
          builder: (_, theme) {
            return Center(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => context.read<ThemeCubit>().toggleTheme(),
                  child: theme.brightness == Brightness.dark
                      ? const Icon(Icons.dark_mode)
                      : const Icon(
                          Icons.light_mode,
                          color: Colors.black,
                        ),
                ),
              ),
            );
          },
        ),
        const WidthSize(12),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SearchBar(
            hintText: l10n.searchArticle,
            padding: const EdgeInsets.only(bottom: 8),
            onChanged: _onSearch,
            controller: searchController,
          ),
        ),
      ),
    );
  }

  @override
  ScaffoldAttribute buildAttribute() {
    return ScaffoldAttribute();
  }

  @override
  Widget buildNarrowLayout(BuildContext context, SizingInformation sizeInfo) {
    final theme = context.theme;
    return Column(
      children: [
        Expanded(
          child: SearchArticleListView(
            stringQuery: searchController.text,
            callback: () => _search(searchController.text),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: theme.backgroundColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Ditemukan Dari Filter',
                    style: FontTheme.rubik16w500black1().copyWith(
                      color: theme.cardColor,
                    ),
                  ),
                  BlocBuilder<SearchArticleBloc, SearchArticleState>(
                    builder: (c, state) {
                      return Text(
                        '''
${state is SearchArticleSuccess ? state.totalCount : 0} Hasil''',
                        style: FontTheme.rubik14w400black4(),
                      );
                    },
                  ),
                ],
              ),
              InkWell(
                child: Row(
                  children: <Widget>[
                    GlobalIcon.svg(
                      'filter',
                      color: theme.cardColor,
                    ),
                    const WidthSize(6),
                    Text(
                      'Filter',
                      style: FontTheme.rubik14w500black1().copyWith(
                        color: theme.cardColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
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
    return false;
  }
}
