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
  final Completer<WebViewController> controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            WebView(
              initialUrl: widget.url,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: controller.complete,
              onProgress: _onProgress,
              navigationDelegate: _navigationDelegate,
              onPageStarted: (String url) {
                AppLogger.i('Page started loading: $url');
              },
              onPageFinished: _onPageFinish,
              gestureNavigationEnabled: true,
            ),
            OnReactive(
              () {
                if (progressWebViewRM.state.progress < 1.0) {
                  return LinearProgressIndicator(
                    value: progressWebViewRM.state.progress,
                    valueColor:
                        const AlwaysStoppedAnimation(BaseColors.primary),
                  );
                }
                return const SizedBox.shrink();
              },
            )
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
    progressWebViewRM.setState((s) {
      s.progress = progress / 100;
    });
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
