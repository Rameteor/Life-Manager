#if canImport(UIKit) && canImport(WebKit)
import SwiftUI
import WebKit

/// 在 Xcode Canvas 中直接预览本地 Life Manager 网页。
///
/// 运行预览前，请确保网页开发服务器正在 `http://127.0.0.1:4173/` 运行。
public struct LifeManagerWebPreview: UIViewRepresentable {
    public enum Module: String, CaseIterable, Sendable {
        case home
        case goals
        case daily
        case ledger
        case fitness
        case mood
        case reading
        case travel
        case english
    }

    private let module: Module
    private let baseURL: URL

    public init(
        module: Module = .home,
        baseURL: URL = URL(string: "http://127.0.0.1:4173/")!
    ) {
        self.module = module
        self.baseURL = baseURL
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(module: module)
    }

    public func makeUIView(context: Context) -> WKWebView {
        let configuration = WKWebViewConfiguration()
        configuration.websiteDataStore = .nonPersistent()
        configuration.userContentController.addUserScript(
            WKUserScript(
                source: Self.previewBootstrapScript(module: module),
                injectionTime: .atDocumentStart,
                forMainFrameOnly: true
            )
        )

        let webView = WKWebView(frame: .zero, configuration: configuration)
        webView.navigationDelegate = context.coordinator
        webView.isOpaque = false
        webView.backgroundColor = UIColor(
            red: 247 / 255,
            green: 242 / 255,
            blue: 233 / 255,
            alpha: 1
        )
        webView.scrollView.backgroundColor = webView.backgroundColor
        webView.scrollView.contentInsetAdjustmentBehavior = .never
        webView.allowsBackForwardNavigationGestures = false
        webView.load(URLRequest(url: baseURL))
        return webView
    }

    public func updateUIView(_ webView: WKWebView, context: Context) {
        guard context.coordinator.module != module else { return }
        context.coordinator.module = module
        webView.evaluateJavaScript(
            "localStorage.setItem('lifeWorkbench.active', '\(module.rawValue)'); location.reload();"
        )
    }

    private static func previewBootstrapScript(module: Module) -> String {
        """
        localStorage.setItem('lifeWorkbench.active', '\(module.rawValue)');
        """
    }

    public final class Coordinator: NSObject, WKNavigationDelegate {
        fileprivate var module: Module

        fileprivate init(module: Module) {
            self.module = module
        }
    }
}

private struct PreviewFrame: View {
    let module: LifeManagerWebPreview.Module

    var body: some View {
        LifeManagerWebPreview(module: module)
            .background(
                Color(
                    red: 247 / 255,
                    green: 242 / 255,
                    blue: 233 / 255
                )
            )
    }
}

#Preview("人生看板 · 当前状态") {
    PreviewFrame(module: .home)
}

#Preview("每日计划") {
    PreviewFrame(module: .daily)
}

#Preview("记账") {
    PreviewFrame(module: .ledger)
}

#Preview("人生看板 · 深色画布") {
    PreviewFrame(module: .home)
        .preferredColorScheme(.dark)
}
#endif
