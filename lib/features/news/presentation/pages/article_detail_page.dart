part of '_pages.dart';

class ArticleDetailPage extends StatefulWidget {
  const ArticleDetailPage({
    Key? key,
    required this.article,
  }) : super(key: key);

  final ArticleModel article;

  @override
  _ArticleDetailPageState createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends BaseStateful<ArticleDetailPage> {
  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    // return BaseAppBar();
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
    final size = sizeInfo.screenSize;
    final theme = context.theme;
    final l10n = context.l10n;
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: size.width * .7,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: false,
            titlePadding: const EdgeInsets.fromLTRB(60, 16, 16, 16),
            title: Text(
              widget.article.title.toString(),
            ),
            background: Stack(
              children: [
                Hero(
                  tag: widget.article.urlToImage ?? 'default',
                  child: CustomNetworkImage(
                    url: widget.article.urlToImage,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        BaseColors.black.withOpacity(.8),
                        Colors.transparent,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuthorInformationWidget(
                    authorsName: widget.article.author.toString(),
                  ),
                  const HeightSize(6),
                  Text(
                    DateTime.parse(widget.article.publishedAt!).formattedyMMMd,
                    style: FontTheme.rubik14w400black1().copyWith(
                      color: theme.cardColor,
                    ),
                  ),
                  const HeightSize(20),
                  Text(
                    widget.article.content.toString(),
                    style: FontTheme.rubik14w400black1().copyWith(
                      color: theme.cardColor,
                    ),
                  ),
                  const HeightSize(20),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.grey[300],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () => nav.push(
                            WebViewArticle(
                              url: widget.article.url.toString(),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 12,
                            ),
                            child: Text(
                              l10n.fullArticle,
                              style: FontTheme.rubik14w400black1(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const HeightSize(2000),
                ],
              ),
            ),
          ]),
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
    return true;
  }
}
