part of '_pages.dart';

class WebViewArticle extends StatefulWidget {
  const WebViewArticle({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  _WebViewArticleState createState() => _WebViewArticleState();
}

class _WebViewArticleState extends State<WebViewArticle> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: _onProgress,
          onPageStarted: (String url) {
            AppLogger.i('Page started loading: $url');
          },
          onPageFinished: _onPageFinish,
          onNavigationRequest: _navigationDelegate,
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            WebViewWidget(
              controller: controller,
            ),
            // OnReactive(
            //   () {
            //     if (progressWebViewRM.state.progress < 1.0) {
            //       return LinearProgressIndicator(
            //         value: progressWebViewRM.state.progress,
            //         valueColor:
            //             const AlwaysStoppedAnimation(BaseColors.primary),
            //       );
            //     }
            //     return const SizedBox.shrink();
            //   },
            // )
          ],
        ),
      ),
    );
  }

  void _onPageFinish(String url) {
    AppLogger.i('Page finished loading: $url');
  }

  void _onProgress(int progress) {
    AppLogger.i(progress);
    // progressWebViewRM.setState((s) {
    //   s.progress = progress / 100;
    // });
  }

  NavigationDecision _navigationDelegate(NavigationRequest request) {
    if (request.url.startsWith('https://www.youtube.com/')) {
      AppLogger.i('navigation to $request blocked');
      return NavigationDecision.prevent;
    }
    AppLogger.i('navigation to $request allowed');
    return NavigationDecision.navigate;
  }
}
