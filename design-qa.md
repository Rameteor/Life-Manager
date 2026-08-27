# Life Manager · Page Fidelity Design QA

## 每日计划 · 2026-08-26

### 对照基准

- Source visual truth：`.codex-audit/daily-comparison-2026-08-26/01-reference.png`
- Implementation screenshot：`.codex-audit/daily-comparison-2026-08-26/07-final.png`
- Full-view comparison：`.codex-audit/daily-comparison-2026-08-26/08-final-side-by-side.png`
- Focused scroll evidence：`.codex-audit/daily-comparison-2026-08-26/06-focus-note.png`
- Narrow validation：`.codex-audit/daily-comparison-2026-08-26/05-narrow.png`
- Audit notes：`.codex-audit/daily-comparison-2026-08-26/audit.md`

### 视口与归一化

- 参考图：853 × 1844 px，包含 iPhone 外框、Dynamic Island、状态栏与 Home Indicator。
- 实现图：402 × 874 px；CSS viewport 402 × 874；截图密度 1×。
- 并排图：参考图和实现图统一缩放到 874 px 高度后并排。
- 判断范围：只比较应用内容；设备外框和系统 UI 不属于 Web 实现范围。
- 数据状态：参考为 3 条示例计划、完成 2 条；实现为 5 条真实计划、完成 0 条。动态内容差异单独分类，不作为视觉缺陷。

### Findings

- P0：0
- P1：0
- P2：0

强制视觉面均已通过：

- 字体与层级：标题、日期、计划标题和辅助文字保持宋体编辑感；“完成数＋星标 / 进度条＋百分比”层级与独立效果图一致。
- 间距与布局：日期切换、完成率、四分段导航、时间轴、添加按钮、重点卡和固定底栏顺序一致；五条计划自然增高页面而不截断数据。
- 颜色与 tokens：暖纸底、暖白卡片、计划蓝 `#5a86ac`、完成青绿 `#489b96`、装饰金 `#ddb467` 和浅蓝重点卡一致；未完成状态使用中性灰。
- 图片质量：胶带为透明 WebP，428 × 268，已正确解码；生产页面没有 PNG 依赖。
- 图标与状态：统一使用 Phosphor 图标；完成态、待完成态、进度条和时间轴语义清晰。
- 响应式与可访问性：402 × 874 和 360 × 780 均无横向溢出；五个时间入口和五个状态控件均保留可访问名称。

### Comparison History

1. 首轮：用新的单页效果图重新制作同尺寸对照，确认结构基本一致，并记录设备外框与真实数据差异。
2. 第二轮：校准暖纸底和吸顶标题背景；将未完成状态文字恢复为中性灰；保留五条计划并检查重点卡滚动访问。
3. 第三轮：复核顶部完成率层级，确认独立效果图为第一行“计划完成＋星标”、第二行“进度条＋百分比”；隐藏移动端滚动条装饰并完成最终并排截图。
4. 标题接缝复验：浏览器视口初检后，进一步在 iPhone 17 Pro / iOS 26.5 模拟器确认 Safari 合成层仍有接缝；最终统一 `.main` 与顶部栏背景，并加入 1 px WebKit 接缝覆盖层。
   - 证据：`.codex-audit/title-seam-2026-08-26/04-daily-simulator-final.png`。

### Primary Interactions Tested

- 五条计划和五个时间编辑入口全部存在。
- 点击已有计划时间可打开“编辑计划”，首条正确读取 09:00–10:30。
- 前一天切换到 8月25日 周二，再返回 8月26日 周三成功。
- 五条计划后可继续滚动查看“今日重点”。
- 402 × 874 和 360 × 780 均无横向溢出。
- 胶带图片 `complete: true`，`naturalWidth: 428`，`naturalHeight: 268`。
- 控制台 error/warn：0。

### Open Questions

- 无阻塞问题。P3 仅剩设备外框差异，以及五条真实计划会把重点卡自然推到首屏以下。

## 人生看板首页 · 2026-08-26

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
4. 标题接缝复验：在 iPhone 17 Pro / iOS 26.5 模拟器中复现 Safari 合成层横线，统一 `.main` 与顶部栏背景并覆盖 1 px 拼接缝，标题区域恢复连续暖纸背景。
   - 证据：`.codex-audit/title-seam-2026-08-26/05-home-simulator-final.png`。

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

## 剩余七页统一优化 · 2026-08-26

本轮按 `life-manager-page-fidelity` 工作流一次完成记账、阅读、习惯与行程、英语学习、目标管理、运动打卡和心情日记。

### 统一证据

每页目录均包含独立参考 `01-reference.png`、首轮当前图 `02-current.png`、最终实现 `08-final.png`、最终并排 `09-final-side-by-side.png`、360px 窄屏 `06-360.png`、iPhone 17 Pro 模拟器 `07-simulator.png` 和 `audit.md`：

- `.codex-audit/ledger-comparison-2026-08-26/`
- `.codex-audit/reading-comparison-2026-08-26/`
- `.codex-audit/habits-travel-comparison-2026-08-26/`
- `.codex-audit/english-learning-comparison-2026-08-26/`
- `.codex-audit/goals-comparison-2026-08-26/`
- `.codex-audit/fitness-comparison-2026-08-26/`
- `.codex-audit/mood-journal-comparison-2026-08-26/`

### 最终结果

- 七页 P0/P1/P2 均为 0；结构、字体、间距、暖纸色、模块强调色和固定底部导航通过。
- 402×874 与 360px 的七页均满足 `scrollWidth === clientWidth`。
- 七页移动端摘要按钮缺失可访问名称数为 0；顶部快捷图标均连接对应真实表单。
- 生产资产目录中的位图全部为 WebP；阅读、行程、心情所用图片在浏览器中均 `complete: true`。
- 动态金额、计划、目标、习惯、训练、日记和单词数量继续以用户真实本地数据为准，因此不会为了追求截图数字而伪造记录。
- iPhone 17 Pro / iOS 26.5 Safari 已逐页截图复核；页面可滚动访问首屏以下内容。

### Comparison History

1. 第一轮：建立七张独立效果图、当前 402×874 截图和等高并排图，定位结构差异。
2. 第二轮：重排阅读、习惯行程、目标、运动、心情与英语摘要层，并校准记账层级、顶部图标和模块颜色。
3. 第三轮：补齐窄屏响应、真实表单入口、WebP 解码检查、空数据引导和 iPhone 17 Pro 模拟器证据。

## 全站移动端功能优化 · 2026-08-27

### 范围与证据

- Source：`/Users/meteor/Documents/mine/manager/index.html`
- 实现：同文件内的移动端摘要渲染、公共详情导航、侧栏和模块事件处理。
- CSS 目标视口：402 × 874；最终设备复核：iPhone 17 Pro / iOS 26.5 模拟器，外层截图 423 × 904。
- 功能审计与最终截图：`.codex-audit/simulator-functional-audit-2026-08-26/`。
- 关键证据：`21a-english-detail-fixed.png`、`23a-mood-preselected-fixed.png`、`24a-habit-form-visible-fixed.png`、`24b-trip-card-opens-fixed.png`、`25a-ledger-entries-fixed.png`、`26a-drawer-import-visible.png`、`27a-goal-card-opens-fixed.png`、`28a-reading-book-opens-fixed.png`、`29-ledger-month-picker-final.png`。

### 修复结果

- 公共详情导航改为布局稳定后的双帧定位，并使用顶部栏与返回栏的真实高度计算偏移；习惯表单、账单列表、趋势图及记录列表均能准确落位。
- 详情态新增“返回摘要”，同时隐藏固定底部导航，避免表单提交按钮被遮住。
- 侧栏在手机上压缩为完整可达布局；快捷操作、分析、导出和导入全部显示，打开快捷操作或分析时侧栏会先收起。
- 记账月份与目标年份改为真实选择控件；账单“查看全部”进入当前月份记录，目标卡进入对应目标。
- 运动卡严格使用当天真实数据；多项训练显示“n 项训练”，无记录时不再伪造 30 分钟、1 次或 118 次/分。
- 心情快捷按钮会把对应分值带入表单；行程、当前阅读和书架卡片会打开对应记录。
- 英语“查看详情”进入学习趋势，“全部”进入单词库，“例句”改为可执行的英文朗读。
- 阅读总页数使用真实默认值 320，不再把占位符误认为已填写内容。

### 回归检查

- 九个模块均能完成渲染；本地浏览器 console error/warn：0。
- 模拟器确认：英语详情与返回摘要、心情预选、习惯表单可见、行程卡、账单列表、目标卡、图书卡、侧栏工具和月份选择器均通过。
- 桌面端未泄漏移动端详情工具栏；生产图片仍全部使用 WebP。
- 本轮没有删除原有数据，也没有执行 Git commit 或 push。

### Remaining P3

- 原生月份/年份选择面板的具体外观由 iOS Safari 控制；页面内触发器已与效果图保持为单一文字加下拉箭头。
- 模拟器测试数据 `QA`、测试账目和测试单词仍保留，便于后续回归。

## 全站移动端顶部锚点统一 · 2026-08-27

### 范围与证据

- Source / implementation：`/Users/meteor/Documents/mine/manager/index.html`。
- 视觉基准：人生看板标题区；用户反馈图与实现证据位于 `.codex-audit/header-alignment-2026-08-27/`。
- CSS 视口：402 × 874；归一化对照截取实现顶部 402 × 102，并按参考图高度等比缩放。
- 完整对照：`05-home-normalized-comparison.png`；每日计划修复前后：`06-daily-before-after.png`。

### 修复结果

- 九个模块顶部栏统一为 102px，高度不再随日期副标题有无变化。
- 标题左边缘统一为 17px，顶部统一为 31.5px；首页字体栅格化测得 31.69px，属于亚像素差异。
- 右侧按钮统一为 44 × 44px，顶部 28px、右边距 17px；按钮仅与大标题文字框中心对齐，首页日期不参与计算。
- 首页大标题中心为 50.047px、按钮中心为 50px，误差 0.047px；其他页面误差约 0.141px。
- 非首页标题使用独立的顶部锚点补偿，不伪造日期副标题，也不改变模块内容语义。
- 九页第一块正文容器统一从 y = 108px 开始，即 102px 公共顶部栏加 6px 内容间距；修复前各页曾分散在 102、108、110 和 120px。
- 移动端滚动条不再占据布局宽度，长短页面切换时按钮不会横向移动。
- 详情返回栏和锚点滚动偏移随公共顶部高度同步更新。

### 回归检查

- 浏览器 402 × 874 九页坐标逐项检查通过：home、daily、ledger、goals、fitness、mood、reading、travel、english。
- iPhone 17 Pro / iOS 26.5 模拟器复核人生看板与每日计划，按钮均与大标题中心线重合；证据为 `.codex-audit/header-alignment-2026-08-27/08-simulator-daily-centered.png`。
- 首页与每日计划最终 402 × 874 同尺寸并排证据：`.codex-audit/header-alignment-2026-08-27/11-home-daily-final-side-by-side.png`。
- 暖纸背景、中文衬线字体、Phosphor 图标和所有真实交互保持不变。
- 本轮未执行 Git commit 或 push。

### Remaining P3

- 不同标题汉字的字面黑度和视觉重心存在正常差异；几何坐标已一致，无需用逐页 transform 做破坏性光学校正。

final result: passed
