# Life Manager iPhone App 产品与技术规格

> 文档版本：0.1<br>
> 状态：Draft<br>
> 目标版本：iPhone 本地版 v1<br>
> 更新时间：2026-08-27<br>
> 实施计划：[plan.md](plan.md)

## 1. 产品定义

Life Manager iPhone App 是现有个人生活管理 Web 应用的本地优先移动版本。它面向单一设备所有者，不要求注册或联网，保留人生看板、目标、计划、记账、运动、心情、阅读、习惯与行程、英语学习以及本地规则分析。

### 1.1 目标用户

- 第一阶段只有 App 所有者本人。
- 用户使用个人 iPhone，通过 Xcode 安装。
- 用户重视隐私、离线可用和数据可恢复性，高于多设备同步。

### 1.2 产品目标

- 把现有成熟 Web 功能变为真正可安装的 iPhone App。
- 不依赖服务器也能完整记录和查看个人数据。
- 降低浏览器缓存被清理造成的数据丢失风险。
- 通过通知、Face ID、系统文件和触感提供必要的原生体验。

### 1.3 非目标

- v1 不服务多用户，不处理账号、协作或跨设备冲突。
- v1 不追求原生控件覆盖全部页面。
- v1 不承诺 App Store 审核条件或公开分发。
- v1 不把规则分析包装成医疗、财务或心理诊断。

## 2. 功能需求

优先级定义：P0 为首版必须完成；P1 为不阻塞首版的增强。

### 2.1 应用容器

- **APP-001（P0）**：App 必须从安装包加载 Web 页面，不依赖本地开发服务器。
- **APP-002（P0）**：九个现有模块及其增删改查行为必须保持可用。
- **APP-003（P0）**：App 必须支持 iOS 17 及以上的 iPhone。
- **APP-004（P0）**：App 默认使用竖屏；横屏不作为首版验收场景。
- **APP-005（P0）**：外部链接不得在主 WebView 内任意跳转；需要打开时交给系统浏览器。

### 2.2 离线资源

- **OFF-001（P0）**：Chart.js、图标字体、中文字体、WebP 图片和纸张纹理必须随 App 打包。
- **OFF-002（P0）**：飞行模式下图表和核心交互必须正常工作。
- **OFF-003（P0）**：构建时应能检测残留的 `http://` 或 `https://` 运行依赖。

### 2.3 数据持久化与备份

- **DATA-001（P0）**：JavaScript 继续维护当前业务状态与 schema 规范化逻辑。
- **DATA-002（P0）**：每次业务状态成功保存后，必须同步一份完整 JSON 到原生层。
- **DATA-003（P0）**：原生状态必须使用临时文件加原子替换写入，不能直接覆盖唯一有效文件。
- **DATA-004（P0）**：App 启动时以最新有效的原生状态恢复 Web `localStorage`。
- **DATA-005（P0）**：原生存储不存在时，允许使用当前 Web 状态并建立首份原生快照。
- **DATA-006（P0）**：导入必须复用现有 `normalizeState()` 校验和迁移逻辑。
- **DATA-007（P0）**：导入覆盖前必须保存当前状态；失败时原状态保持不变。
- **DATA-008（P0）**：导出格式继续使用 `{ app, exportedAt, data }`，保持与网页版兼容。
- **DATA-009（P1）**：在“更多”中显示最近一次原生保存和手动备份时间。

### 2.4 隐私认证

- **AUTH-001（P0）**：启动和从后台恢复时，在私人内容出现前执行 LocalAuthentication。
- **AUTH-002（P0）**：优先使用 Face ID，并允许系统设备密码作为回退。
- **AUTH-003（P0）**：用户取消或认证失败时停留在遮挡页面，不销毁数据。
- **AUTH-004（P0）**：模拟器、未设置设备密码或不支持生物认证时允许降级进入。
- **AUTH-005（P1）**：后续可增加“离开多久后重新锁定”的设置；v1 使用每次回到前台重新验证。

### 2.5 本地通知

- **NOTIF-001（P0）**：首次出现可提醒内容时先展示用途说明，再请求系统权限。
- **NOTIF-002（P0）**：有有效日期、开始时间且未完成的计划，在开始时间提醒。
- **NOTIF-003（P0）**：未完成且未归档的目标，在截止日前一天 20:00 提醒。
- **NOTIF-004（P0）**：单词按 `nextReviewDate` 聚合，在到期日 20:00 发送一次复习提醒。
- **NOTIF-005（P0）**：只维护未来 30 天通知，并在启动、状态变化和进入后台前补齐。
- **NOTIF-006（P0）**：业务对象完成、删除、延期或归档后必须取消旧通知。
- **NOTIF-007（P0）**：通知权限被拒绝时，其他功能不得受影响。

### 2.6 原生触感与文件能力

- **NATIVE-001（P0）**：成功保存、警告、轻触分别映射到系统触感。
- **NATIVE-002（P0）**：iOS 环境仅触发一次原生触感，不能与 Web vibration 重复。
- **NATIVE-003（P0）**：导出使用系统分享或文件导出界面。
- **NATIVE-004（P0）**：导入使用系统文件选择器，只接受 JSON 文件。

## 3. 体验要求

- 启动背景、状态栏和 Web 页面使用同一暖纸色，不能出现白屏闪烁。
- AppIcon 延续当前“生”字识别符号，主色使用暖纸色与珊瑚橙。
- WebView 不显示浏览器工具栏、回退历史或橡皮筋造成的空白背景。
- 继续满足现有 44 × 44px 最小触控区域和 safe-area 规则。
- 系统字体或本地字体加载失败时必须有可读的 fallback。
- Face ID 遮挡页面不得在 App 切换器快照中泄露生活数据。

## 4. 技术架构

### 4.1 组件职责

| 组件 | 职责 |
| --- | --- |
| `LifeManagerApp` | SwiftUI 生命周期、前后台状态和认证门禁 |
| `LifeManagerWebView` | 创建、配置和加载 WKWebView |
| `LifeManagerBridge` | 验证并路由 Web 与原生消息 |
| `LifeManagerRepository` | 原子保存、恢复、备份和导入导出 |
| `NotificationCoordinator` | 权限、调度、去重和取消本地通知 |
| Web 应用 | 业务状态、表单、渲染、schema 迁移和通知描述生成 |

### 4.2 数据流

1. App 启动后，Repository 读取最近有效的原生 JSON。
2. WebView 创建前，原生状态通过 `WKUserScript` 注入指定的 `localStorage` key。
3. Web 应用执行现有 `loadState()` 与 `normalizeState()`。
4. 每次 `saveState()` 成功后，Web 发送 `stateChanged`。
5. Repository 原子保存状态；NotificationCoordinator 同步提醒。
6. 原生写入失败时保留旧状态，并回传错误供 Web 显示非阻塞提示。

不得让 Swift 重新实现目标进度、预算、连续天数、SM-2 或周度分析等业务规则。

## 5. Web 与原生接口

### 5.1 Web → Native

统一调用：

```js
window.webkit.messageHandlers.lifeManager.postMessage(message)
```

消息格式：

```ts
type WebToNativeMessage =
  | { type: 'stateChanged'; requestId: string; state: LifeManagerState }
  | { type: 'exportBackup'; requestId: string; payload: BackupEnvelope }
  | { type: 'importBackup'; requestId: string }
  | { type: 'syncNotifications'; requestId: string; notifications: LocalReminder[] }
  | { type: 'haptic'; requestId: string; style: 'light' | 'success' | 'warning' };

type BackupEnvelope = {
  app: 'life-workbench';
  exportedAt: string;
  data: LifeManagerState;
};

type LocalReminder = {
  id: string;
  kind: 'todo' | 'goal' | 'english';
  title: string;
  body: string;
  fireAt: string; // 带时区的 ISO 8601
};
```

要求：

- `requestId` 必须唯一，用于匹配异步结果。
- 原生层必须校验消息类型、字段长度、日期和 payload 大小。
- 未知消息不得执行，记录开发日志后返回错误。

### 5.2 Native → Web

统一回调：

```js
window.LifeManagerNative.receive(result)
```

结果格式：

```ts
type NativeResult = {
  requestId: string;
  ok: boolean;
  type: 'saveResult' | 'exportResult' | 'importResult' | 'notificationResult';
  payload?: unknown;
  error?: { code: string; message: string };
};
```

导入结果中的备份只能交给 `normalizeState()` 校验，原生层不得直接替换页面状态。

## 6. 目标目录结构

```text
.
├── apps/
│   └── ios/
│       ├── LifeManager.xcodeproj/
│       ├── LifeManager/
│       │   ├── App/
│       │   ├── Bridge/
│       │   ├── Data/
│       │   ├── Notifications/
│       │   ├── Security/
│       │   └── Resources/
│       └── LifeManagerTests/
├── web/
│   ├── index.html
│   ├── assets/
│   └── vendor/
├── docs/
│   └── ios-app/
│       ├── plan.md
│       └── spec.md
├── scripts/
├── README.md
└── CHANGELOG.md
```

目录约束：

- 根目录只保留仓库级说明、配置和顶层目录。
- 产品与技术规格放在 `docs/<主题>/`。
- iOS Swift 源码只能放在 `apps/ios/` 对应职责目录。
- Web 运行源码只能放在 `web/`；第三方资源放 `web/vendor/`，不得混入 `assets/`。
- 构建、检查和资源同步脚本放 `scripts/`。
- 临时截图、QA 证据和构建产物不得提交到产品源码目录。
- 不复制两份可编辑的 Web 源码；App Bundle 中的内容必须来自 `web/`。

## 7. 数据与故障规则

- 原生主文件：`Application Support/LifeManager/state.json`。
- 写入过程：序列化 → 写入临时文件 → 校验可读取 → 原子替换主文件。
- 替换前将上一有效版本保留为 `state.previous.json`。
- 导入前额外保存带时间戳的 pre-import 备份。
- App 卸载会删除 Application Support；用户必须依靠手动 Files/iCloud Drive 备份恢复。
- 原生 JSON 与 Web schema 版本不一致时，以 Web `normalizeState()` 的兼容规则为准。
- 不记录心情正文、消费备注、目标标题等私人 payload 到控制台或分析日志。

## 8. 验收标准

以下条件全部满足才可标记 v1 完成：

1. Xcode 可以无警告构建并安装到个人 iPhone。
2. 断网状态下冷启动，九个模块和图表均可使用。
3. 创建每类记录并强制退出后，重新打开数据完整且无重复。
4. schema v1、v2、v3 备份均可导入；损坏或未来版本备份被安全拒绝。
5. 导出后卸载、重装并导入，可以恢复全部业务集合。
6. Face ID 取消时不显示私人页面；认证成功后正常进入。
7. 三类提醒按规则触发，修改和删除后没有残留通知。
8. 360px、402px 和 iPhone 17 Pro 下无横向溢出或安全区遮挡。
9. 当前浏览器版的现有功能回归通过，且未丢失未提交改动。

## 9. 后续版本候选

- v1.1：提醒偏好、锁定等待时间、原生保存状态页。
- v2：Apple Developer Program、TestFlight、正式上架准备。
- v2+：可选 CloudKit 同步、Widget、快捷指令和 HealthKit。
- 是否全量 SwiftUI 重写，必须在 v1 有真实使用反馈后另立规格，不在本规格内扩张。
