part of '_widgets.dart';

class NewsCard extends StatelessWidget {
  final ArticleModel article;
  final VoidCallback? onTap;

  const NewsCard({
    Key? key,
    required this.article,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
          ),
          child: Row(
            children: [
              SizedBox(
                width: 70,
                height: 70,
                child: Hero(
                  tag: article.urlToImage ?? 'default',
                  child: CustomNetworkImage(
                    url: article.urlToImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      article.title.toString(),
                      maxLines: 2,
                      style: FontTheme.rubik16w500black1().copyWith(
                        color: theme.cardColor,
                      ),
                    ),
                    const HeightSize(4),
                    Text(
                      article.description.toString(),
                      maxLines: 3,
                      style: FontTheme.rubik12w400black1().copyWith(
                        color: theme.cardColor,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
