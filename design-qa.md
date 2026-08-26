# Life Manager · 人生看板首页 Design QA

日期：2026-08-26
最终结果：passed

## 对照基准

- Source visual truth：`.codex-audit/home-comparison-2026-08-26/01-reference.png`
- Implementation screenshot：`.codex-audit/home-implementation-round/05-final-candidate.png`
- Full-view comparison：`.codex-audit/home-implementation-round/06-reference-vs-final.png`
- Focused comparison（标题、问候、概览、优先事项）：`.codex-audit/home-implementation-round/08-focus-header-priority.png`
- Focused comparison（目标、习惯、生活记录、成就、底部导航）：`.codex-audit/home-implementation-round/09-focus-cards-navigation.png`
- 窄屏验证：`.codex-audit/home-implementation-round/07-narrow-360x800.png`

## 视口与归一化

- 参考图：850 × 1564 px，包含 iPhone 外框、状态栏和 Home Indicator。
- 实现图：402 × 874 px；CSS viewport 402 × 874；截图密度 1×。
- 对照图：两侧等高缩放到 1600 px 后并排；参考图约 870 × 1600，实现在对照中约 736 × 1600。
- 判断范围：只比较应用拥有的内容；设备外框、Dynamic Island、系统状态栏和 Home Indicator 不作为实现差异。
- 状态：2026-08-26，本地真实数据；参考图中的 3/5、62%、两排习惯记录等静态示例与当前数据不同，不作为视觉缺陷。

## Findings

- P0：0
- P1：0
- P2：0

五个强制视觉面均已通过：

- 字体与层级：标题使用宋体风格展示字体；字号、字重、日期层级和正文换行已接近参考图，长文案没有截断。
- 间距与布局：首屏模块顺序、双列目标/习惯卡、生活记录、成就墙和固定底部导航一致；402 × 874 无遮挡，360 × 800 无横向溢出。
- 颜色与 tokens：暖纸底、暖白卡片、珊瑚橙、青绿色完成态和金色点缀保持一致；概览已取消多余外卡。
- 图片质量：干花纸张、阅读咖啡图均为真实 WebP，解码完成且比例正确；没有 SVG/CSS 占位插画。
- 文案与内容：固定文案与参考方向一致；计划、目标、习惯、账目和成就数字继续来自真实本地数据。

## Open Questions

- 无阻塞问题。参考图生活记录上的胶带装饰，以及更完整的植物标本叠层，可作为 P3 细节继续微调。

## Comparison History

1. 第一轮发现：标题偏小、右上角仍是菜单、今日概览有多余外卡、速记按钮不是圆形、任务状态辨识度不足。
   - 修复：放大标题并恢复日期星标；首页右上角改为可用的编辑入口；概览去外卡；速记改成 54 px 圆形主按钮；补充进行中/完成/待完成状态样式。
   - 证据：`.codex-audit/home-implementation-round/01-round-one.png`。
2. 第二轮发现：问候卡、优先事项卡偏高，概览图标与标签层级不一致，生活记录与成就墙密度仍有偏差。
   - 修复：压缩问候和优先事项高度；概览改为图标+标签同排、数值单独一行；调整生活记录图片比例并提高成就卡层级。
   - 证据：`.codex-audit/home-implementation-round/03-round-two.png`。
3. 第三轮发现：使用首屏均匀分布后，成就卡被固定导航遮挡（P2）。
   - 修复：重新计算首页可用高度，把最小内容高度从 `100svh - 188px` 调整为 `100svh - 213px`。
   - 证据：问题截图 `.codex-audit/home-implementation-round/04-round-three.png`；修复后 `.codex-audit/home-implementation-round/05-final-candidate.png`。

## Primary Interactions Tested

- 右上角编辑按钮打开“添加今日待办”底部面板。
- 中央“速记”按钮打开智能记录面板并可关闭。
- 底部“计划”与“首页”可以往返切换。
- 当前页面图片均 `complete: true` 且 `naturalWidth: 900`。
- 浏览器控制台错误：0。

## Implementation Checklist

- [x] P1 首页结构和关键状态
- [x] P2 字体、纸张质感、卡片密度和图片比例
- [x] 402 × 874 同状态截图对照
- [x] 360 × 800 窄屏检查
- [x] 核心交互、图片加载和控制台检查

## Follow-up Polish

- P3：补充生活记录图片上方的真实纸胶带小素材。
- P3：在有对应数据时继续核对完成态、62% 目标进度和双排习惯点阵的视觉状态。

final result: passed
