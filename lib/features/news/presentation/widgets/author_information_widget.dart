part of '_widgets.dart';

class AuthorInformationWidget extends StatelessWidget {
  const AuthorInformationWidget({
    Key? key,
    required this.authorsName,
  }) : super(key: key);

  final String authorsName;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Row(
      children: [
        Text(
          'Author: ',
          style: FontTheme.rubik16w500black1().copyWith(
            color: theme.cardColor,
          ),
        ),
        const WidthSize(10),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            authorsName,
            style: FontTheme.rubik14w400black1(),
          ),
        ),
      ],
    );
  }
}
