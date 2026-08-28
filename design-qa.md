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
- 首个可见内容进一步以人生看板问候卡片外框顶部为基准，而不是卡片内部“早安”文字：每日计划日期、记账月份和目标年份选择器改为从工具行顶部绘制。
- 上移不只作用于首行文字：每日计划完成进度随内容流上移约 9px，记账余额卡片与目标统计卡片各上移 8px，后续区块继续保持原有相对顺序和间距节奏。
- 每日计划在 360px 窄屏将内容流位移收敛为 8px，使进度区顶部与 44px 日期按钮点击区域刚好相接、不发生几何重叠。
- 移动端滚动条不再占据布局宽度，长短页面切换时按钮不会横向移动。
- 详情返回栏和锚点滚动偏移随公共顶部高度同步更新。

### 回归检查

- 浏览器 402 × 874 九页坐标逐项检查通过：home、daily、ledger、goals、fitness、mood、reading、travel、english。
- iPhone 17 Pro / iOS 26.5 模拟器复核人生看板与每日计划，按钮均与大标题中心线重合；证据为 `.codex-audit/header-alignment-2026-08-27/08-simulator-daily-centered.png`。
- 首页与每日计划最终 402 × 874 同尺寸并排证据：`.codex-audit/header-alignment-2026-08-27/11-home-daily-final-side-by-side.png`。
- 可见内容起点专项证据：`.codex-audit/content-visible-start-2026-08-27/06-reference-home-normalized.png`、`07-four-page-visible-start.png`；九页首个可见内容 top 均为 108px。
- 内容流专项测量：402px 下每日计划日期按钮仍为 44 × 44px，日期行至完成进度保留 4.42px 间距；360px 下两者边界相接但不重叠，横向溢出为 0。
- 暖纸背景、中文衬线字体、Phosphor 图标和所有真实交互保持不变。
- 本轮未执行 Git commit 或 push。

### Remaining P3

- 不同标题汉字的字面黑度和视觉重心存在正常差异；几何坐标已一致，无需用逐页 transform 做破坏性光学校正。

## 记账页高保真与交互复核 · 2026-08-27

### 范围与证据

- Reference：`.codex-audit/ledger-comparison-2026-08-27/01-reference.png`，853 × 1844，包含设备外框。
- Implementation：`/Users/meteor/Documents/mine/manager/index.html`。
- 402 × 874 最终图：`.codex-audit/ledger-comparison-2026-08-27/08-final.png`；同高度对照：`09-final-side-by-side.png`。
- 360 × 800：`06-360.png`；iPhone 17 Pro / iOS 26.5 Safari：`07-simulator.png`。

### 修复结果

- 月份选择器默认提供最近 12 个月，并兼容账本中更早月份；只有本月数据时也能真实切换和查看零状态。
- 月份旁的眼睛升级为 44 × 44px 隐私按钮，可隐藏或恢复余额、收支、分类和最近账单金额，状态与焦点语义完整。
- 支出分类“查看全部”和分类按钮进入真实分类图表，不再误跳普通账单列表。
- 快捷记账按钮调整为 `#d69a2a`，余额卡调整为 `#fbf5e7`；分类和最近记录图标改为固定语义色，文本密度更接近效果图。

### 回归检查

- 402 × 874：月份起点 top = 108px、余额卡 top = 146px，隐私按钮保持 44 × 44px，横向溢出为 0。
- 360 × 800：五列分类、余额卡和主按钮无裁切，横向溢出为 0。
- 临时新增并删除 `QA·地铁通勤`，确认保存、交通分类汇总、图标颜色、全部账单和删除闭环通过，测试记录无残留。
- iPhone 17 Pro 模拟器确认四笔真实账目状态下的视觉密度与金额隐藏/恢复均通过。
- 当前金额与效果图示例值不同属于真实数据差异，没有为了截图伪造用户记录。

### Remaining P3

- 效果图包含生成式设备外框与示例数据；页面内部视觉和交互已独立验证，无需把真实账目改成示例值。

final result: passed

## 侧边栏导航 · 2026-08-28

### 范围与证据

- 视觉来源：`docs/design-references/sidebar-navigation-image2-v1.webp`（853 × 1844，Image 2 生成）；实现：`index.html` 内共享侧边栏结构与移动端样式。
- 审计目录：`.codex-audit/sidebar-navigation-implementation-2026-08-28/`。
- 修复前为 `02-before-402.jpg`；402 × 874 最终页为 `27-final-spacing-icons-402x874.jpg`；Safari 短视口为 `20-spacing-restored-402x660-top.jpg`；最终参考并排为 `24-reference-vs-restored-spacing.png`。
- 归一化方法：将包含设备框的参考图等比缩放至 874px 高，与 402 × 874 浏览器视口截图水平并排；设备框与网页视口的安全区差异不作为内容布局误差。

### 忠实度结果

- Typography：新增“人生管理”宋体标题、辅助语和分区标签；导航与工具文字保持清晰的人文无衬线层级。
- Spacing：移动抽屉为 `min(82vw, 330px)`；品牌底部留白 42px，普通模块 52px、选中模块 58px。短 Safari 视口保留相同密度并允许内部滚动。
- Colors：暖象牙纸面、暖深色遮罩及珊瑚 / 蓝 / 金 / 青语义色与设计稿一致；当前模块指示条跟随模块色。
- Imagery：抽屉不新增生产位图，背景继续使用真实页面内容；设计参考保存为 WebP。
- Copy/content：模块顺序保持真实系统结构；“周度数据分析”在抽屉中简化为“数据分析”，实际入口仍打开完整周度分析。

### 比较与修复历史

- 第一轮移除标题下方悬浮白板结构，改为全高抽屉；恢复品牌头、主要模块标签和工具分区。
- 第二轮将工具区改为 2 × 2、去除模块图标圆形底板、完成选中纸签和语义色指示条，并把关闭按钮校准为 44 × 44 圆形。
- 第三轮针对 Safari 底栏与圆角反馈：抽屉使用 `100svh`，右上角归零、右下角收为 16px。
- 第四轮撤销短视口强制压缩：普通模块恢复 52px、选中模块 58px，品牌到分区增加留白；空间不足时滚动抽屉而不是缩小内容。
- 第五轮将箱子和星芒并回标题行：标题到箱子、箱子到星芒均为 9px；箱子与标题几何中心对齐，星芒比标题上沿高 8px。
- 402 × 874：抽屉宽 329.63px、高 874px，`scrollHeight = 891px`；仅需 17px 轻微滚动即可完整显示第二排工具。
- 402 × 660 Safari 短视口保持同一视觉密度并可内部滚动；iPhone 17 Pro 模拟器最终截图为 `26-simulator-brand-icons-final.png`。

### 交互与回归

- 已验证人生看板 → 心情日记切换后抽屉自动关闭，再次打开时“心情日记”选中且指示条为对应蓝色。
- 已验证顶部关闭按钮和右侧遮罩均可关闭抽屉；“数据分析”可打开周度数据分析弹层。
- 1280 × 900 桌面端侧边栏维持 220px 宽，移动分区标签隐藏，页面横向无溢出。
- 页面破损图片为 0；控制台 error / warn 为 0；内联 JavaScript、`git diff --check` 和生产位图 WebP-only 检查通过。

### Remaining P3

- 设计稿带完整设备外框，真实 Safari 内容视口的顶部安全区更紧凑；实现按真实触控空间保留，而非机械复制 mockup 留白。

final result: passed

## 心情日记详情子页面 · 2026-08-27

### 范围与证据

- 主页面参考：`.codex-audit/mood-detail-ux-2026-08-27/01-reference.webp`；效果图与最终摘要同高对照：`15-reference-vs-updated.png`。
- 修复前摘要 / 通用详情：`02-current-summary.png`、`03-current-quick-detail.png`。
- 402px：`04-updated-summary.png`、`05-updated-quick-detail.png`、`06-updated-edit-detail.png`、`07-updated-trend-detail.png`、`08-updated-trend-month.png`、`09-updated-history-detail.png`。
- 360px：`10-narrow-360-quick-detail.png`；桌面回归：`11-desktop-regression.png`。
- iPhone 17 Pro：`12-simulator-summary.jpeg`、`13-simulator-edit.jpeg`、`14-simulator-trend.jpeg`。

### 修复结果

- 将原来把表单、趋势、洞察、动态与历史串在一起的通用长页拆为“记录此刻 / 编辑日记 / 心情趋势 / 全部日记”四条聚焦路径。
- 摘要“今日记录”现在可以打开已有条目并完整回填心情、正文、标签和日期；新增与编辑保存逻辑分离，不会重复创建记录。
- 趋势周 / 月切换留在当前子页面，并增加“查看全部日记”入口；全部日记将打开与删除目标分离。
- 删除改为二次确认，明确日期、心情及趋势 / 标签洞察的同步影响。
- 子页面视觉沿用已确认主页面的蓝灰强调色、暖纸背景、中文编辑式标题和圆形情绪符号；没有虚构不存在的详情效果图。

### 回归检查

- 402 × 874 下主内容宽 376px、起点 y=108；360 × 780 下宽 334px、起点 y=108；两种宽度横向溢出均为 0。
- 隔离浏览器完成新增页、已有记录编辑页、趋势周 / 月切换、全部日记、删除确认取消；未产生测试数据。
- iPhone 17 Pro 模拟器完成摘要 → 已有日记编辑 → 返回摘要 → 心情趋势；未保存、编辑或删除真实记录。
- 桌面端完整表单、趋势、洞察、动态和全部日记均保留；控制台 error / warn 为 0。
- 内联 JavaScript、`git diff --check` 与生产位图 WebP-only 检查通过。

### Remaining P3

- 待补充四个子页面的专属效果图后，可继续做键盘展开态、标签展开态和图表数据密集态的逐像素校准。

final result: passed

## 运动打卡详情子页面 · 2026-08-27

### 范围与证据

- 视觉系统参考：`.codex-audit/fitness-detail-ux-2026-08-27/01-visual-system-reference.webp`；同高对照：`17-normalized-side-by-side.png`。
- 修复前摘要 / 详情：`02-current-summary.png`、`03-current-quick-detail.png`；修复后：`04-summary-after.png`、`13-final-quick-402.png`、`06-records-after-402.png`、`07-edit-after-402.png`。
- 360 × 800：`08-edit-expanded-360.png`、`09-delete-confirm-360.png`、`15-final-quick-360.png`；iPhone 17 Pro：`12-simulator-records.png`、`14-simulator-quick-no-divider.png`。
- 当前没有运动详情专属效果图，因此沿用已确认运动打卡主页面的暖纸、青绿、AJ 球鞋和中文编辑式层级，不宣称对不存在的详情稿逐像素复刻。

### 修复结果

- 通用长页拆为快速打卡、全部记录和单条编辑三个聚焦子页面；摘要和记录行均可直接进入编辑。
- 新增平均心率与训练备注；全部记录支持运动类型 / 日期范围联合筛选，并展示全部数据而非最多 16 条。
- 删除加入二次确认，说明本周活动、连续打卡和热量统计会同步变化。
- iOS 日期控件收回输入框边界；摘要“最近运动”不再换行；用户指出的输入框下方旧附加项分隔线已移除。
- AJ 球鞋继续使用 `assets/air-jordan-1-low-ivory.webp`，没有新增非 WebP 生产位图。

### 回归检查

- 402 × 874 与 360 × 800 横向溢出均为 0；表单分别为 376px 和 334px 宽。
- 360px 展开态备注宽 300px；日期、热量、心率和主要操作均留在卡片内部。
- 1280 × 900 桌面端保留完整摘要、快速表单与热力图，横向溢出为 0；证据为 `18-desktop-regression-1280.png`。
- 类型筛选空状态、编辑回填、原生心率上限校验和删除确认取消均通过，真实记录未改变。
- iPhone 17 Pro 完成摘要 → 快速打卡 → 返回 → 全部记录；未保存、编辑或删除真实数据。
- 控制台 error / warn 为 0；内联 JavaScript、`git diff --check` 与生产位图 WebP-only 检查通过。

### Remaining P3

- 待有运动详情专属效果图后，可继续校准筛选控件和表单文字基线；当前无行动性 P0/P1/P2。

final result: passed

## 阅读页高保真与交互复核 · 2026-08-27

### 范围与证据

- Reference：`.codex-audit/reading-comparison-2026-08-27/01-reference.png`，来自独立阅读页效果图。
- Implementation：`/Users/meteor/Documents/mine/manager/index.html`。
- 402 × 874 最终图：`.codex-audit/reading-comparison-2026-08-27/08-final.png`；同高度对照：`09-final-side-by-side.png`。
- 360 × 800：`06-360.png`；iPhone 17 Pro / iOS 26.5 Safari：`07-simulator.png`。

### 修复结果

- 修正“今日阅读目标”标题的浏览器默认外边距，恢复效果图中的紧凑标题、单行指标和进度条层级。
- 当前阅读、阅读目标、最近笔记和书架分别校准为 170 / 92 / 150 / 211px 的卡片节奏；书架补回完整暖白卡片边界，减少页面下半段无意义留白。
- 阅读圆环改为随真实完成比例绘制，并为线性进度补充 `progressbar`、范围和当前值语义。
- 书籍进度表单新增“本次阅读分钟”；阅读日志现在同时保存页数与时长，摘要目标优先使用真实分钟，旧记录仍兼容页数估算。
- “最近笔记”改为跨书架按更新时间选取，并展示对应书名与真实页码；当前阅读卡不再被任意长度的笔记正文撑坏。

### 回归检查

- 临时新增 `QA·阅读页回归`，记录 12 页、18 分钟和一条笔记；摘要的 10% 进度、18 分钟目标与最近笔记同步更新。
- 通过删除确认流程清理测试书籍，关联阅读日志和笔记无残留。
- 402 × 874、360 × 800 与 iPhone 17 Pro 均完成视觉复核；模拟器确认当前书籍卡可进入对应详情，“本次分钟”输入可见，返回摘要可用。
- 浏览器控制台 error / warn 为 0；内联 JavaScript、`git diff --check` 与生产位图 WebP-only 检查通过。
- 效果图的书名、页数和进度为示例内容；实现保持用户本地真实数据。

### Remaining P3

- 效果图包含生成式设备外框与示例数据，最终对照以页面内部结构、比例、颜色和交互一致为准。

final result: passed

## 习惯与行程页高保真与交互复核 · 2026-08-27

### 范围与证据

- Reference：`.codex-audit/habits-travel-comparison-2026-08-27/01-reference.png`。
- Implementation：`/Users/meteor/Documents/mine/manager/index.html`。
- 402 × 874 最终图：`.codex-audit/habits-travel-comparison-2026-08-27/08-final.png`；同高度对照：`09-final-side-by-side.png`。
- 真实计划状态：`05-populated.png`；360 × 800：`06-360.png`；iPhone 17 Pro / iOS 26.5 Safari：`07-simulator.png`。

### 修复结果

- 修正“本周进胜”为“本周连胜”，并从完成总数改为本周最长连续天数。
- 摘要习惯状态补齐未记录、打卡、补签、请假和未来日期语义；真实习惯不再误用所在行的模板时长说明。
- 今日计划先合并用户自定时间和合理回退时间，再排序、截取前三项；空状态升级为可点击入口，直接进入每日计划。
- 旅行默认选择优先未结束计划，摘要能区分即将出行、正在旅行和旅程回顾；任意目的地不再伪造杭州路线。
- 旅行卡补齐效果图中的顶部箭头和右下行李箱，保留湖畔 WebP 图片、浅蓝卡片与真实详情入口。
- 本周习惯网格的星期文字与圆点统一按七个网格列居中；修复前七列圆点均向左偏约 9.86px，修复后 402px 与 360px 下中心差均为 0px。

### 回归检查

- 用正式表单临时创建 09:00 与 19:30 两条计划，确认摘要按时间排序；随后通过真实管理界面删除。
- 临时创建 `QA·习惯回归`，完成“打卡 → 请假 → 清除”循环并删除；连胜从 0 → 1 → 0 正确联动。
- 临时创建未来三天旅行 `QA·苏州`，验证“即将出行”和 3 天，再通过删除确认框清理；测试数据无残留。
- 402 × 874、360 × 800 和 iPhone 17 Pro 均完成复核；模拟器旅行卡进入对应详情与返回摘要通过。
- 对齐修复证据补充为 `10-alignment-fixed.png`、`11-alignment-fixed-360.png` 与 `12-simulator-alignment-fixed.png`，模拟器刷新后四行圆点均与星期标题处于同一纵向中心线。
- 浏览器控制台 error / warn 为 0；内联 JavaScript、`git diff --check` 和生产位图 WebP-only 检查通过。
- 参考图中的三条计划、五天连胜与杭州三天属于示例数据，最终实现继续尊重用户真实本地状态。

### Remaining P3

- 无计划时页面自然比示例图短；这是数据状态差异。真实计划状态的版式密度已在 `05-populated.png` 单独验证。

final result: passed

## 英语学习页高保真与交互复核 · 2026-08-27

### 范围与证据

- Reference：.codex-audit/english-learning-comparison-2026-08-27/01-reference.png，852 × 1846，包含设备外框。
- Implementation：/Users/meteor/Documents/mine/manager/index.html。
- 402 × 874：11-final.png；同高度对照：12-final-side-by-side.png。
- 360 × 800：07-360.png；iPhone 17 Pro / iOS 26.5 Safari：09-simulator-final.png。

### 修复结果

- 今日金色高亮从固定周六改为真实日期；本周学习量按单词 ID 去重，待复习标签读取最后一次真实评分。
- 无到期单词时移除三个无法执行的复习按钮，展示真实下次日期，并提供“添加新词 / 查看词库”入口。
- 主卡不再给所有单词套用 serendipity 的词性和例句；只有对应参考词使用正确资料，其他词缺少资料时明确展示空状态。
- 三档复习按钮统一为效果图中的暖白底蓝色描边；目标进度补齐 progressbar 范围与当前值语义。
- 长英文标题限制为两行、自适应字号并保留完整存储内容；模拟器中的六行真实标题不再撑坏首屏。

### 回归检查

- 使用 localhost 隔离存储完成空词库、新增 alignment、1/10 目标、无到期状态、打开词库和删除清理闭环，未触碰 127.0.0.1 用户数据。
- 统计入口与返回摘要通过；真实到期词的朗读和三档复习操作保留，但未点击改变用户复习排程。
- 402 × 874 下四张核心卡横向溢出为 0；360 × 800 下主词卡宽 334px，三档按钮均约 97.33px。
- iPhone 17 Pro 模拟器确认真实周四金色、周三完成态、两行长标题、周节奏与待复习区显示正常。
- 内联 JavaScript、git diff --check 与生产位图 WebP-only 检查通过。

### Remaining P3

- 效果图的 20/30 与 112 词为示例内容，最终页面保持浏览器内的真实学习数据。

final result: passed

## 英语学习词条复习子页面 · 2026-08-27

### 范围与证据

- 入口参考：`.codex-audit/english-word-library-audit-2026-08-27/01-reference.png`。
- Implementation：`/Users/meteor/Documents/mine/manager/index.html`。
- 402 × 874：`07-repair-402-front.png`、`08-repair-402-flipped.png`、`09-repair-long-402.png`。
- 360 × 800：`10-repair-long-360.png`、`11-repair-due-360.png`。
- iPhone 17 Pro / iOS 26.5 Safari：`12-simulator-front.png`、`13-simulator-flipped.png`、`14-simulator-return.png`。

### 修复结果

- 移动端词卡改为稳定的正反面显隐，避免 WebKit 3D 透视与裁切叠加导致内容压缩；翻面前后分别显示“查看释义 / 返回词条”。
- 长英文使用自适应字号、任意断行和两行截断，释义限制三行；状态、音标、元数据、删除和复习操作不再互相覆盖。
- 三枚复习按钮进入正常文档流，360px 下每枚约 97.33 × 44px；删除按钮固定为 44 × 44px，均符合移动触控要求。
- 添加表单和词库标题统一为“词条”语义，明确支持单词、短语或标题，同时保留原有完整数据。

### 回归检查

- 402px 与 360px 横向溢出均为 0；超长英文标题的可视高度受两行边界约束，完整内容仍保留在数据和无障碍名称中。
- 隔离域名通过正式表单新增长标题与长释义完成压测，没有触碰用户真实数据。
- 模拟器中两条真实长词条均不再越界；首张卡的三枚评分按钮完整可见，翻面与返回摘要通过。
- 未点击真实“忘记 / 模糊 / 简单”或删除按钮，用户复习排程未改变。
- 内联 JavaScript、`git diff --check` 与生产位图 WebP-only 检查通过。

### Remaining P3

- 模块大标题与详情返回栏保留少量信息重复，但分别承担身份和返回路径，当前无需牺牲可理解性继续压缩。

final result: passed

## 目标详情子页面一致性 · 2026-08-27

### 范围与证据

- 视觉系统参考：`.codex-audit/goal-detail-ux-2026-08-27/01-visual-system-reference.png`；同高对照：`03-side-by-side.png`。
- 修复前：`02-before-402.png`；修复后：`04-final-402.png`、`05-final-360.png`。
- 展开态：`06-expanded-settings.png`；iPhone 17 Pro：`07-simulator.png`、`08-simulator-expanded.png`、`09-simulator-return.png`。
- 当前没有目标详情专属效果图，因此以目标管理主页面的纸张质感、珊瑚色、目标符号和信息层级为设计系统依据，不宣称不存在的逐像素详情对照。

### 修复结果

- 详情从通用管理表单整理为目标编辑卡，补齐圆形目标符号、框架/层级标签、截止信息、状态和进度的阅读层级。
- 当前进度与目标状态并列，保存与添加动作均为 44px 高；删除使用垃圾桶图标和完整无障碍名称。
- “里程碑与行动拆解”增加空状态引导，名称与类型留在首层；目标值、单次推进、单位收进可展开的“计量设置”。
- 工具栏文案从冗长的“目标管理详细管理”收敛为“目标详情”，返回摘要路径保持可见。

### 回归检查

- 402 × 874 与 360 × 800 横向溢出均为 0px；目标卡分别为 376px 和 334px 宽。
- 402px 展开态中两列计量输入各约 166.5 × 44px，单位输入 342 × 44px；布局没有越界。
- 1280 × 720 桌面端保持原有多列表单；控制台 error / warn 为 0。
- iPhone 17 Pro 模拟器完成“进入详情 → 展开计量设置 → 返回摘要”，未保存、添加或删除真实数据。
- 内联 JavaScript、`git diff --check` 与生产位图 WebP-only 检查通过。

### Remaining P3

- 待有目标详情专属效果图后，可再做一次字体基线与细间距的逐像素校准。

final result: passed

## 首页目标 / 习惯双卡内容间距 · 2026-08-27

### 证据与结果

- 用户批注：`.codex-audit/home-card-spacing-2026-08-27/01-user-markup.png`；聚焦结果：`05-final-focus.png`；同高并排：`06-side-by-side.png`。
- 目标卡标题到内容原为 9px，习惯卡标题到星期栏原为 0px；修正后 402 × 874 与 360 × 800 下两者均为 9px。
- 第二次批注进一步指出七天区域整体没有与“习惯打卡”和习惯名称对齐；现改为单一七列网格，首尾贴齐、内部等距分布。
- 402px 下标题、网格首列与习惯名称左边界均为 218.5px；360px 下均为 197.5px，每列星期和圆点中心差为 0px。
- 两种宽度横向溢出均为 0；最终 iPhone 17 Pro 模拟器证据为 `11-simulator-final.png`，下方卡片未被挤压。
- 隔离浏览器中临时创建的 `QA·计划详情` 已从正式管理视图删除，测试数据无残留。
- 内联 JavaScript、`git diff --check` 与生产位图 WebP-only 检查通过。

final result: passed

## 每日计划详情编辑层 · 2026-08-27

### 范围与证据

- 视觉系统参考：`.codex-audit/daily-plan-detail-ux-2026-08-27/01-visual-system-reference.png`；同高对照：`09-side-by-side.png`。
- 修复前添加 / 编辑态：`02-current-add.png`、`03-current-edit.png`；修复后：`04-final-add-402.png`、`05-final-edit-402.png`。
- 360 × 800：`06-final-add-360.png`；iPhone 17 Pro：`07-simulator-add.png`、`08-simulator-return.png`。
- 当前没有计划详情专属效果图，因此详情层沿用每日计划主页面的蓝色、暖纸、中文编辑式层级，不宣称对不存在的详情稿逐像素复刻。

### 修复结果

- 添加 / 编辑层新增日历符号、明确日期和上下文说明，标题、输入、时间、优先级与主要动作形成稳定层级。
- 新增可编辑计划日期；跨日保存后日程会移动到目标日期并重新排序，标题日期与提交按钮同步更新。
- 计划标题区域也可直接进入编辑，不再只能点狭窄的时间列。
- 编辑态增加带二次确认的删除入口；关闭按钮文案随添加 / 编辑上下文变化。
- 记录打开前滚动位置并在关闭后恢复，修复 iOS Safari 输入聚焦导致返回后日期与完成率被顶出视口的问题。

### 回归检查

- 402 × 874：编辑层宽 402px、高约 470px；日期输入 364 × 44px，主要按钮 364 × 46px，横向溢出 0。
- 360 × 800：编辑层宽 360px、高约 485px；标题和日期输入 322px，双时间输入各约 156.5px，关闭按钮 44 × 44px，横向溢出 0。
- 隔离浏览器完成“添加 → 点标题编辑 → 非法时间拦截 → 移动到次日 → 删除确认取消 → 再次确认删除”，测试计划无残留。
- iPhone 17 Pro 模拟器确认最新版详情层全部字段可见，关闭后回到打开前的每日计划顶部位置，未保存真实计划。
- 控制台 error / warn 为 0；内联 JavaScript、`git diff --check` 与生产位图 WebP-only 检查通过。

### Remaining P3

- 详情层没有独立设计稿；若后续补充专属效果图，可继续校准键盘展开态的微小光学间距。

final result: passed

## 记账详情子页面 · 2026-08-27

### 范围与证据

- 视觉系统参考：`.codex-audit/ledger-detail-ux-2026-08-27/01-visual-system-reference.png`；修复前后同高对照：`11-before-after.png`；视觉系统与最终子页面：`12-reference-and-final.png`。
- 本轮用户批注：`18-user-ring-issue.png`、`19-user-form-issue.png`。
- 402px：`04-after-quick-402.png`、`05-after-all-402.png`；360px：`06-after-quick-360.png`、`07-after-all-360.png`。
- 桌面回归：`08-desktop-regression-1280.png`；iPhone 17 Pro：`09-simulator-all-bills.png`、`10-simulator-quick-entry.png`。
- 当前没有快速记账或全部账单专属效果图，因此沿用已确认记账主页面的金色、暖纸、圆形分类符号和中文编辑式层级，不宣称对不存在的详情稿逐像素复刻。

### 修复结果

- 将通用“记账详细管理”长页拆为快速记账、全部账单和支出分析三个聚焦子页面，预算与无关图表不再混入当前任务。
- 快速记账补齐收据符号、明确标题、暖色输入、自我投资说明和金色主要动作；摘要账单可直接进入编辑并完整回填。
- 全部账单改为当前月完整列表，支持类型 / 分类联合筛选；编辑入口与 44px 删除入口分离。
- 删除改为二次确认，明确账目、日期、金额及月度统计影响。

### 回归检查

- 隔离数据完成新增 → 编辑 → 联合筛选 → 取消删除 → 确认删除，测试账目已清理。
- 用户复核后再次校准圆环中心：402px 与 360px 下文字组合几何中心和圆环圆心差均为 `0px`；证据为 `13-ring-center-fix-402.png`、`16-simulator-ring-final.png`。
- 圆环光学细化将标签提升至 9px、数字提升至 17px并收紧间距，百分比统一为一位小数；三栏对照见 `.codex-audit/ledger-ring-optical-audit-2026-08-27/07-reference-before-final.png`。
- 圆角端点试验产生白色断口，用户复核后已撤回；最终保持连续圆环、原金色与暖米色轨道，iPhone 17 Pro 证据为 `10-simulator-continuous-final.png`。
- 快速记账页移除重复详情栏标题和原生双箭头；日期输入固定在双列卡片内容区内，自我投资说明与保存按钮改为完整宽度上下排列。
- 第二次隔离回归完成新增并删除 `QA圆环表单复核`，测试数据无残留；最终页面见 `14-quick-entry-fix-402.png`、`15-quick-entry-fix-360.png`、`17-simulator-quick-final.png`。
- 402 × 874 与 360 × 780 横向溢出均为 0；详情卡分别为 376px 和 334px 宽。
- 1280 × 900 桌面端保持完整表单、筛选与账单列表，横向溢出为 0。
- iPhone 17 Pro 模拟器完成摘要 → 全部账单 → 返回摘要 → 快速记账，未保存、编辑或删除真实账目。
- 控制台 error / warn 为 0；内联 JavaScript、`git diff --check` 与生产位图 WebP-only 检查通过。

### Remaining P3

- 待有两个详情页的专属效果图后，可继续做金额输入与账单行基线的逐像素校准。

final result: passed
