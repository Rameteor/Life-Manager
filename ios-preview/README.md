# Life Manager Xcode Canvas Preview

这个 Swift Package 不会改动现有网页。它通过 `WKWebView` 把本地 Life Manager 加载到 Xcode Canvas，并在页面脚本执行前设置要查看的模块。

## 使用方式

1. 保持网页开发服务器运行：`http://127.0.0.1:4173/`。
2. 用 Xcode 打开本目录中的 `Package.swift`。
3. 打开 `Sources/LifeManagerPreview/LifeManagerWebPreview.swift`。
4. 选择 `Editor → Canvas`，或按 `Option + Command + Enter`。
5. 点击 Canvas 顶部的 Resume。

文件底部已经提供四个状态：

- 人生看板 · 当前状态
- 每日计划
- 记账
- 人生看板 · 深色画布

复制一个 `#Preview` 并修改 `module:`，即可查看其他模块：

```swift
#Preview("运动打卡") {
    PreviewFrame(module: .fitness)
        .previewDevice(PreviewDevice(rawValue: "iPhone 17 Pro"))
}
```

如果本地端口发生变化，只需要修改 `LifeManagerWebPreview` 初始化器里的 `baseURL`。
