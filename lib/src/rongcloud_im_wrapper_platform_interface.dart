import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'rongcloud_im_wrapper_method_channel.dart';
import 'package:rongcloud_im_wrapper_plugin/rongcloud_im_wrapper_plugin.dart';

abstract class RCIMWrapperPlatform extends PlatformInterface {
  RCIMWrapperPlatform() : super(token: _token);

  static final Object _token = Object();

  static RCIMWrapperPlatform _instance = RCIMWrapperMethodChannel();

  static RCIMWrapperPlatform get instance => _instance;

  RCIMIWEngine? _engine;

  RCIMIWEngine? get engine => _engine;

  static set instance(RCIMWrapperPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  void setEngine(RCIMIWEngine engine) {
    _engine = engine;
  }

  /// 引擎构建方法
  /// - [appKey] 开发者后台获取的 AppKey
  /// - [options] 引擎相关配置项
  Future<void> create(String appKey, RCIMIWEngineOptions options) {
    throw UnimplementedError('create() has not been implemented.');
  }

  /// 销毁引擎
  Future<void> destroy() {
    throw UnimplementedError('destroy() has not been implemented.');
  }

  /// 连接融云服务器，在整个应用程序全局，只需要调用一次。调用此接口返回非业务错误码时，SDK 会启动重连机制进行重连；如果仍没有连接成功，会在设备网络状态变化时再次进行重连。
  /// - [token] 调用 server api 获取到的 token
  /// - [timeout] 连接超时时间，单位：秒。
  /// timeLimit <= 0，则 IM 将一直连接，直到连接成功或者无法连接（如 token 非法）
  /// timeLimit > 0，则 IM 将最多连接 timeLimit 秒
  /// 如果在 timeLimit 秒内连接成功，后面再发生了网络变化或前后台切换，SDK 会自动重连； 如果在 timeLimit 秒无法连接成功则不再进行重连，通过 listener 告知连接超时，您需要再自行调用 connect 接口
  /// - [callback] 链接事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] 接口回调可以监听 [onConnected]
  Future<int> connect(String token, int timeout,
      {RCIMIWConnectCallback? callback}) async {
    throw UnimplementedError('connect() has not been implemented.');
  }

  /// 断开链接
  /// 注：因为 SDK 在前后台切换或者网络出现异常都会自动重连，保证连接可靠性。 所以除非您的 App 逻辑需要登出，否则一般不需要调用此方法进行手动断开
  /// - [receivePush] 退出后是否接收 push，true:断开后接收远程推送，false:断开后不再接收远程推送
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> disconnect(bool receivePush) async {
    throw UnimplementedError('disconnect() has not been implemented.');
  }

  /// 构建文本消息
  /// - [type] 会话类型，
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [text] 文本内容
  /// - [返回值] 文本消息实体
  Future<RCIMIWTextMessage?> createTextMessage(RCIMIWConversationType type,
      String targetId, String? channelId, String text) async {
    throw UnimplementedError('createTextMessage() has not been implemented.');
  }

  /// 构建图片消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [path] 图片消息的本地路径，必须为有效路径
  /// - [返回值] 图片消息实体
  Future<RCIMIWImageMessage?> createImageMessage(RCIMIWConversationType type,
      String targetId, String? channelId, String path) async {
    throw UnimplementedError('createImageMessage() has not been implemented.');
  }

  /// 构建文件消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [path] 文件消息的本地路径，必须为有效路径
  /// - [返回值] 文件消息实体
  Future<RCIMIWFileMessage?> createFileMessage(RCIMIWConversationType type,
      String targetId, String? channelId, String path) async {
    throw UnimplementedError('createFileMessage() has not been implemented.');
  }

  /// 构建小视频消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [path] 小视频消息的本地路径，必须为有效路径
  /// - [duration] 小视频消息的视频时长
  /// - [返回值] 视频消息实体
  Future<RCIMIWSightMessage?> createSightMessage(RCIMIWConversationType type,
      String targetId, String? channelId, String path, int duration) async {
    throw UnimplementedError('createSightMessage() has not been implemented.');
  }

  /// 构建语音消息 (高清语音)
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [path] 语音消息的本地路径，必须为有效路径
  /// - [duration] 语音消息的消息时长
  /// - [返回值] 语音消息的实体
  Future<RCIMIWVoiceMessage?> createVoiceMessage(RCIMIWConversationType type,
      String targetId, String? channelId, String path, int duration) async {
    throw UnimplementedError('createVoiceMessage() has not been implemented.');
  }

  /// 构建引用消息
  /// - [type] 会话类型
  /// - [targetId]    会话 ID
  /// - [channelId]   频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [referenceMessage] 引用的消息
  /// - [text]   引用的文本内容
  /// - [返回值] 引用消息实体
  Future<RCIMIWReferenceMessage?> createReferenceMessage(
      RCIMIWConversationType type,
      String targetId,
      String? channelId,
      RCIMIWMessage referenceMessage,
      String text) async {
    throw UnimplementedError(
        'createReferenceMessage() has not been implemented.');
  }

  /// 构建 GIF 消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [path] GIF 消息的本地路径
  /// - [返回值] GIF 消息实体
  Future<RCIMIWGIFMessage?> createGIFMessage(RCIMIWConversationType type,
      String targetId, String? channelId, String path) async {
    throw UnimplementedError('createGIFMessage() has not been implemented.');
  }

  /// 构建自定义消息
  /// - [type] 会话类型
  /// - [targetId]     会话 ID
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [policy]  消息的存储策略
  /// - [messageIdentifier] 消息的标识符，需唯一
  /// - [fields]  消息的内容键值对
  /// - [返回值] 自定义消息实体
  Future<RCIMIWCustomMessage?> createCustomMessage(
      RCIMIWConversationType type,
      String targetId,
      String? channelId,
      RCIMIWCustomMessagePolicy policy,
      String messageIdentifier,
      Map fields) async {
    throw UnimplementedError('createCustomMessage() has not been implemented.');
  }

  /// 构建位置消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [longitude] 经度
  /// - [latitude] 纬度
  /// - [poiName]  POI 信息
  /// - [thumbnailPath] 缩略图本地路径，必须为有效路径
  /// - [返回值] 位置消息实体
  Future<RCIMIWLocationMessage?> createLocationMessage(
      RCIMIWConversationType type,
      String targetId,
      String? channelId,
      double longitude,
      double latitude,
      String poiName,
      String thumbnailPath) async {
    throw UnimplementedError(
        'createLocationMessage() has not been implemented.');
  }

  /// 发送普通消息
  /// - [message] 发送的消息实体
  /// - [callback] 发送消息的事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] 接口回调可以监听 [onMessageAttached],[onMessageSent]
  Future<int> sendMessage(RCIMIWMessage message,
      {RCIMIWSendMessageCallback? callback}) async {
    throw UnimplementedError('sendMessage() has not been implemented.');
  }

  /// 发送媒体消息
  /// - [message] 发送的媒体消息实体
  /// - [listener] 发送媒体消息的事件监听
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] 接口回调可以监听 [onMediaMessageSending],[onMediaMessageAttached],[onMediaMessageSent]
  Future<int> sendMediaMessage(RCIMIWMediaMessage message,
      {RCIMIWSendMediaMessageListener? listener}) async {
    throw UnimplementedError('sendMediaMessage() has not been implemented.');
  }

  /// 取消发送媒体消息
  /// - [message] 需要取消发送的媒体消息实体
  /// - [callback] 取消发送媒体消息的事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] 接口回调可以监听 [onSendingMediaMessageCanceled]
  /// 此接口不支持 Flutter For Web 端
  Future<int> cancelSendingMediaMessage(RCIMIWMediaMessage message,
      {IRCIMIWCancelSendingMediaMessageCallback? callback}) async {
    throw UnimplementedError(
        'cancelSendingMediaMessage() has not been implemented.');
  }

  /// 下载媒体消息
  /// - [message] 需要下载的媒体消息实体
  /// - [listener] 下载媒体消息的事件监听
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMediaMessageDownloaded], [onMediaMessageDownloading]
  /// 此接口不支持 Flutter For Web 端
  Future<int> downloadMediaMessage(RCIMIWMediaMessage message,
      {RCIMIWDownloadMediaMessageListener? listener}) async {
    throw UnimplementedError(
        'downloadMediaMessage() has not been implemented.');
  }

  /// 取消下载媒体消息
  /// - [message] 需要取消下载的媒体消息实体
  /// - [callback] 取消下载媒体消息的事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onDownloadingMediaMessageCanceled]
  /// 此接口不支持 Flutter For Web 端
  Future<int> cancelDownloadingMediaMessage(RCIMIWMediaMessage message,
      {IRCIMIWCancelDownloadingMediaMessageCallback? callback}) async {
    throw UnimplementedError(
        'cancelDownloadingMediaMessage() has not been implemented.');
  }

  /// 加载某个会话
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationLoaded]
  @Deprecated('请使用 [getConversation] 代替')
  Future<int> loadConversation(
      RCIMIWConversationType type, String targetId, String? channelId) async {
    throw UnimplementedError('loadConversation() has not been implemented.');
  }

  /// 获取某个会话
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可
  /// - [callback] 获取会话事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationLoaded]
  Future<int> getConversation(
      RCIMIWConversationType type, String targetId, String? channelId,
      {IRCIMIWGetConversationCallback? callback}) async {
    throw UnimplementedError('getConversation() has not been implemented.');
  }

  /// 加载某些会话
  /// - [conversationTypes] 会话类型
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可
  /// - [startTime]    时间戳（毫秒），获取小于此时间戳的会话，传 0 为查询最新数据
  /// - [count]   查询的数量， 0 < count <= 50
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationsLoaded]
  @Deprecated('请使用 [getConversations] 代替')
  Future<int> loadConversations(List<RCIMIWConversationType> conversationTypes,
      String? channelId, int startTime, int count) async {
    throw UnimplementedError('loadConversations() has not been implemented.');
  }

  /// 获取某些会话
  /// - [conversationTypes] 会话类型
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可
  /// - [startTime]    时间戳（毫秒），获取小于此时间戳的会话，传 0 为查询最新数据
  /// - [count]   查询的数量， 0 < count <= 50
  /// - [callback]     获取会话列表事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationsLoaded]
  Future<int> getConversations(List<RCIMIWConversationType> conversationTypes,
      String? channelId, int startTime, int count,
      {IRCIMIWGetConversationsCallback? callback}) async {
    throw UnimplementedError('getConversations() has not been implemented.');
  }

  /// 获取指定类型的含有未读消息的会话列表
  /// - [conversationTypes] 支持单聊、群聊、系统会话
  /// - [callback] 获取会话列表事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> getUnreadConversations(
      List<RCIMIWConversationType> conversationTypes,
      {IRCIMIWGetUnreadConversationsCallback? callback}) async {
    throw UnimplementedError(
        'getUnreadConversations() has not been implemented.');
  }

  /// 移除某个会话
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可
  /// - [callback] 移除会话事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationRemoved]
  Future<int> removeConversation(
      RCIMIWConversationType type, String targetId, String? channelId,
      {IRCIMIWRemoveConversationCallback? callback}) async {
    throw UnimplementedError('removeConversation() has not been implemented.');
  }

  /// 根据会话类型移除会话
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [callback]     移除会话列表事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationsRemoved]
  /// 此接口不支持 Flutter For Web 端
  Future<int> removeConversations(
      List<RCIMIWConversationType> conversationTypes, String? channelId,
      {IRCIMIWRemoveConversationsCallback? callback}) async {
    throw UnimplementedError('removeConversations() has not been implemented.');
  }

  /// 加载某个会话的未读数
  /// 注：不支持聊天室！
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUnreadCountLoaded]
  @Deprecated('请使用 [getUnreadCount] 代替')
  Future<int> loadUnreadCount(
      RCIMIWConversationType type, String targetId, String? channelId) async {
    throw UnimplementedError('loadUnreadCount() has not been implemented.');
  }

  /// 获取某个会话的未读数
  /// 注：不支持聊天室！
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [callback] 获取会话未读数事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUnreadCountLoaded]
  Future<int> getUnreadCount(
      RCIMIWConversationType type, String targetId, String? channelId,
      {IRCIMIWGetUnreadCountCallback? callback}) async {
    throw UnimplementedError('getUnreadCount() has not been implemented.');
  }

  /// 加载所有未读数
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onTotalUnreadCountLoaded]
  /// 此接口在 Flutter For Web 端不支持设置 [channelId]
  @Deprecated('请使用 [getTotalUnreadCount] 代替')
  Future<int> loadTotalUnreadCount(String? channelId) async {
    throw UnimplementedError(
        'loadTotalUnreadCount() has not been implemented.');
  }

  /// 获取所有未读数
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [callback] 获取所有未读数事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onTotalUnreadCountLoaded]
  /// 此接口在 Flutter For Web 端不支持设置 [channelId]
  Future<int> getTotalUnreadCount(String? channelId,
      {IRCIMIWGetTotalUnreadCountCallback? callback}) async {
    throw UnimplementedError('getTotalUnreadCount() has not been implemented.');
  }

  /// 加载会话中未读的 @ 消息数量。
  /// 注：不支持聊天室！
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUnreadMentionedCountLoaded]
  @Deprecated('请使用 [getUnreadMentionedCount] 代替')
  Future<int> loadUnreadMentionedCount(
      RCIMIWConversationType type, String targetId, String? channelId) async {
    throw UnimplementedError(
        'loadUnreadMentionedCount() has not been implemented.');
  }

  /// 获取会话中未读的 @ 消息数量。
  /// 注：不支持聊天室！
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [callback] 获取会话中未读的 @ 消息数量事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUnreadMentionedCountLoaded]
  Future<int> getUnreadMentionedCount(
      RCIMIWConversationType type, String targetId, String? channelId,
      {IRCIMIWGetUnreadMentionedCountCallback? callback}) async {
    throw UnimplementedError(
        'getUnreadMentionedCount() has not been implemented.');
  }

  /// 加载当前用户加入的所有超级群会话的未读消息数的总和。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupAllUnreadCountLoaded]
  @Deprecated('请使用 [getUltraGroupAllUnreadCount] 代替')
  Future<int> loadUltraGroupAllUnreadCount() async {
    throw UnimplementedError(
        'loadUltraGroupAllUnreadCount() has not been implemented.');
  }

  /// 获取当前用户加入的所有超级群会话的未读消息数的总和。
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupAllUnreadCountLoaded]
  Future<int> getUltraGroupAllUnreadCount(
      {IRCIMIWGetUltraGroupAllUnreadCountCallback? callback}) async {
    throw UnimplementedError(
        'getUltraGroupAllUnreadCount() has not been implemented.');
  }

  /// 加载当前用户加入的所有超级群会话中的未读 @ 消息数的总和。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupAllUnreadMentionedCountLoaded]
  @Deprecated('请使用 [getUltraGroupAllUnreadMentionedCount] 代替')
  Future<int> loadUltraGroupAllUnreadMentionedCount() async {
    throw UnimplementedError(
        'loadUltraGroupAllUnreadMentionedCount() has not been implemented.');
  }

  /// 获取当前用户加入的所有超级群会话中的未读 @ 消息数的总和。
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupAllUnreadMentionedCountLoaded]
  Future<int> getUltraGroupAllUnreadMentionedCount(
      {IRCIMIWGetUltraGroupAllUnreadMentionedCountCallback? callback}) async {
    throw UnimplementedError(
        'getUltraGroupAllUnreadMentionedCount() has not been implemented.');
  }

  /// 获取指定会话的未读消息数
  /// - [targetId] 会话 ID
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupUnreadCountLoaded]
  @Deprecated('请使用 [getUltraGroupUnreadCount] 代替')
  Future<int> loadUltraGroupUnreadCount(String targetId) async {
    throw UnimplementedError(
        'loadUltraGroupUnreadCount() has not been implemented.');
  }

  /// 获取指定会话的未读消息数
  /// - [targetId] 会话 ID
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupUnreadCountLoaded]
  Future<int> getUltraGroupUnreadCount(String targetId,
      {IRCIMIWGetUltraGroupUnreadCountCallback? callback}) async {
    throw UnimplementedError(
        'getUltraGroupUnreadCount() has not been implemented.');
  }

  /// 获取超级群会话中被 @ 的消息数
  /// - [targetId] 会话 ID
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupUnreadMentionedCountLoaded]
  @Deprecated('请使用 [getUltraGroupUnreadMentionedCount] 代替')
  Future<int> loadUltraGroupUnreadMentionedCount(String targetId) async {
    throw UnimplementedError(
        'loadUltraGroupUnreadMentionedCount() has not been implemented.');
  }

  /// 获取超级群会话中被 @ 的消息数
  /// - [targetId] 会话 ID
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupUnreadMentionedCountLoaded]
  Future<int> getUltraGroupUnreadMentionedCount(String targetId,
      {IRCIMIWGetUltraGroupUnreadMentionedCountCallback? callback}) async {
    throw UnimplementedError(
        'getUltraGroupUnreadMentionedCount() has not been implemented.');
  }

  /// 根据会话类型加载未读数
  /// 注：不支持聊天室！
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [contain]      是否包含免打扰消息的未读消息数。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUnreadCountByConversationTypesLoaded]
  /// 此接口在 Flutter For Web 端不支持设置 [channelId]
  @Deprecated('请使用 [getUnreadCountByConversationTypes] 代替')
  Future<int> loadUnreadCountByConversationTypes(
      List<RCIMIWConversationType> conversationTypes,
      String? channelId,
      bool contain) async {
    throw UnimplementedError(
        'loadUnreadCountByConversationTypes() has not been implemented.');
  }

  /// 根据会话类型加载未读数
  /// 注：不支持聊天室！
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [contain]      是否包含免打扰消息的未读消息数。
  /// - [callback]     事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUnreadCountByConversationTypesLoaded]
  /// 此接口在 Flutter For Web 端不支持设置 [channelId]
  Future<int> getUnreadCountByConversationTypes(
      List<RCIMIWConversationType> conversationTypes,
      String? channelId,
      bool contain,
      {IRCIMIWGetUnreadCountByConversationTypesCallback? callback}) async {
    throw UnimplementedError(
        'getUnreadCountByConversationTypes() has not been implemented.');
  }

  /// 清除某个会话中的未读消息数。
  /// 注：不支持聊天室！
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 该会话已阅读的最后一条消息的发送时间戳，清除所有传入当前最新时间戳
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUnreadCountCleared]
  Future<int> clearUnreadCount(RCIMIWConversationType type, String targetId,
      String? channelId, int timestamp,
      {IRCIMIWClearUnreadCountCallback? callback}) async {
    throw UnimplementedError('clearUnreadCount() has not been implemented.');
  }

  /// 保存会话草稿信息。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [draft] 草稿的文字内容。
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onDraftMessageSaved]
  Future<int> saveDraftMessage(RCIMIWConversationType type, String targetId,
      String? channelId, String draft,
      {IRCIMIWSaveDraftMessageCallback? callback}) async {
    throw UnimplementedError('saveDraftMessage() has not been implemented.');
  }

  /// 加载会话中的草稿信息。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onDraftMessageLoaded]
  @Deprecated('请使用 [getDraftMessage] 代替')
  Future<int> loadDraftMessage(
      RCIMIWConversationType type, String targetId, String? channelId) async {
    throw UnimplementedError('loadDraftMessage() has not been implemented.');
  }

  /// 获取会话中的草稿信息。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onDraftMessageLoaded]
  Future<int> getDraftMessage(
      RCIMIWConversationType type, String targetId, String? channelId,
      {IRCIMIWGetDraftMessageCallback? callback}) async {
    throw UnimplementedError('getDraftMessage() has not been implemented.');
  }

  /// 删除指定会话中的草稿信息。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onDraftMessageCleared]
  Future<int> clearDraftMessage(
      RCIMIWConversationType type, String targetId, String? channelId,
      {IRCIMIWClearDraftMessageCallback? callback}) async {
    throw UnimplementedError('clearDraftMessage() has not been implemented.');
  }

  /// 加载免打扰的会话列表。
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onBlockedConversationsLoaded]
  /// 在 Flutter For Web 端，此接口返回的会话对象数据中只有 targetId,channelId,conversationType 是正确的，其他值均为默认值
  @Deprecated('请使用 [getBlockedConversations] 代替')
  Future<int> loadBlockedConversations(
      List<RCIMIWConversationType> conversationTypes, String? channelId) async {
    throw UnimplementedError(
        'loadBlockedConversations() has not been implemented.');
  }

  /// 获取免打扰的会话列表。
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [callback]     事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onBlockedConversationsLoaded]
  /// 在 Flutter For Web 端，此接口返回的会话对象数据中只有 targetId,channelId,conversationType 是正确的，其他值均为默认值
  Future<int> getBlockedConversations(
      List<RCIMIWConversationType> conversationTypes, String? channelId,
      {IRCIMIWGetBlockedConversationsCallback? callback}) async {
    throw UnimplementedError(
        'getBlockedConversations() has not been implemented.');
  }

  /// 设置会话的置顶状态。若会话不存在，调用此方法 SDK 自动创建会话并置顶。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [top]  是否置顶
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationTopStatusChanged]
  /// 此接口在 Flutter For Web 端不支持超级群
  Future<int> changeConversationTopStatus(
      RCIMIWConversationType type, String targetId, String? channelId, bool top,
      {IRCIMIWChangeConversationTopStatusCallback? callback}) async {
    throw UnimplementedError(
        'changeConversationTopStatus() has not been implemented.');
  }

  /// 加载会话的置顶状态
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationTopStatusLoaded]
  /// 此接口在 Flutter For Web 端不支持超级群
  @Deprecated('请使用 [getConversationTopStatus] 代替')
  Future<int> loadConversationTopStatus(
      RCIMIWConversationType type, String targetId, String? channelId) async {
    throw UnimplementedError(
        'loadConversationTopStatus() has not been implemented.');
  }

  /// 获取会话的置顶状态
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationTopStatusLoaded]
  /// 此接口在 Flutter For Web 端不支持超级群
  Future<int> getConversationTopStatus(
      RCIMIWConversationType type, String targetId, String? channelId,
      {IRCIMIWGetConversationTopStatusCallback? callback}) async {
    throw UnimplementedError(
        'getConversationTopStatus() has not been implemented.');
  }

  /// 同步会话阅读状态。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 会话中已读的最后一条消息的发送时间戳
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationReadStatusSynced]
  Future<int> syncConversationReadStatus(RCIMIWConversationType type,
      String targetId, String? channelId, int timestamp,
      {IRCIMIWSyncConversationReadStatusCallback? callback}) async {
    throw UnimplementedError(
        'syncConversationReadStatus() has not been implemented.');
  }

  /// 向会话中发送正在输入的状态，目前只支持单聊。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [currentType] 当前的状态
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> sendTypingStatus(RCIMIWConversationType type, String targetId,
      String? channelId, String currentType) async {
    throw UnimplementedError('sendTypingStatus() has not been implemented.');
  }

  /// 加载历史消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [sentTime] 当前消息时间戳
  /// - [order] 获取消息的方向。BEFORE：获取 sentTime 之前的消息 （时间递减），AFTER：获取 sentTime 之后的消息 （时间递增）
  /// - [policy] 消息的加载策略。LOCAL：只加载本地，REMOTE：只加载远端，LOCAL_REMOTE：本地远端都加载
  /// - [count] 获取的消息数量，0 < count <= 20
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessagesLoaded]
  @Deprecated('请使用 [getMessages] 代替')
  Future<int> loadMessages(
      RCIMIWConversationType type,
      String targetId,
      String? channelId,
      int sentTime,
      RCIMIWTimeOrder order,
      RCIMIWMessageOperationPolicy policy,
      int count) async {
    throw UnimplementedError('loadMessages() has not been implemented.');
  }

  /// 加载历史消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [sentTime] 当前消息时间戳
  /// - [order] 获取消息的方向。BEFORE：获取 sentTime 之前的消息 （时间递减），AFTER：获取 sentTime 之后的消息 （时间递增）
  /// - [policy] 消息的加载策略。LOCAL：只加载本地，REMOTE：只加载远端，LOCAL_REMOTE：本地远端都加载
  /// - [count] 获取的消息数量，0 < count <= 20
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessagesLoaded]
  Future<int> getMessages(
      RCIMIWConversationType type,
      String targetId,
      String? channelId,
      int sentTime,
      RCIMIWTimeOrder order,
      RCIMIWMessageOperationPolicy policy,
      int count,
      {IRCIMIWGetMessagesCallback? callback}) async {
    throw UnimplementedError('getMessages() has not been implemented.');
  }

  /// 根据消息 id 获取消息体（本地数据库索引唯一值）。
  /// - [messageId] 消息的 messageId，可在消息对象中获取
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// 此接口不支持 Flutter For Web 端
  Future<int> getMessageById(int messageId,
      {IRCIMIWGetMessageCallback? callback}) async {
    throw UnimplementedError('getMessageById() has not been implemented.');
  }

  /// 通过全局唯一 id 获取消息实体。
  /// - [messageUId] 消息的 messageUid，可在消息对象中获取，且只有发送成功的消息才会有值。
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// 此接口不支持 Flutter For Web 端
  Future<int> getMessageByUId(String messageUId,
      {IRCIMIWGetMessageCallback? callback}) async {
    throw UnimplementedError('getMessageByUId() has not been implemented.');
  }

  /// 加载第一条未读消息。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onFirstUnreadMessageLoaded]
  /// 此接口不支持 Flutter For Web 端
  @Deprecated('请使用 [getFirstUnreadMessage] 代替')
  Future<int> loadFirstUnreadMessage(
      RCIMIWConversationType type, String targetId, String? channelId) async {
    throw UnimplementedError(
        'loadFirstUnreadMessage() has not been implemented.');
  }

  /// 获取第一条未读消息。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onFirstUnreadMessageLoaded]
  /// 此接口不支持 Flutter For Web 端
  Future<int> getFirstUnreadMessage(
      RCIMIWConversationType type, String targetId, String? channelId,
      {IRCIMIWGetFirstUnreadMessageCallback? callback}) async {
    throw UnimplementedError(
        'getFirstUnreadMessage() has not been implemented.');
  }

  /// 加载会话中未读的 @ 消息。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUnreadMentionedMessagesLoaded]
  /// 此接口不支持 Flutter For Web 端
  @Deprecated('请使用 [getUnreadMentionedMessages] 代替')
  Future<int> loadUnreadMentionedMessages(
      RCIMIWConversationType type, String targetId, String? channelId) async {
    throw UnimplementedError(
        'loadUnreadMentionedMessages() has not been implemented.');
  }

  /// 获取会话中未读的 @ 消息。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUnreadMentionedMessagesLoaded]
  /// 此接口不支持 Flutter For Web 端
  Future<int> getUnreadMentionedMessages(
      RCIMIWConversationType type, String targetId, String? channelId,
      {IRCIMIWGetUnreadMentionedMessagesCallback? callback}) async {
    throw UnimplementedError(
        'getUnreadMentionedMessages() has not been implemented.');
  }

  /// 插入一条消息
  /// - [message] 插入的消息
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessageInserted]
  /// 此接口不支持 Flutter For Web 端
  Future<int> insertMessage(RCIMIWMessage message,
      {IRCIMIWInsertMessageCallback? callback}) async {
    throw UnimplementedError('insertMessage() has not been implemented.');
  }

  /// 插入多条消息，不支持超级群
  /// - [messages] 插入的消息集合
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessagesInserted]
  /// 此接口不支持 Flutter For Web 端
  Future<int> insertMessages(List<RCIMIWMessage> messages,
      {IRCIMIWInsertMessagesCallback? callback}) async {
    throw UnimplementedError('insertMessages() has not been implemented.');
  }

  /// 清除消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 清除消息截止时间戳，0 <= recordTime <= 当前会话最后一条消息的 sentTime, 0 清除所有消息，其他值清除小于等于 recordTime 的消息
  /// - [policy] 清除的策略
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessagesCleared]
  Future<int> clearMessages(RCIMIWConversationType type, String targetId,
      String? channelId, int timestamp, RCIMIWMessageOperationPolicy policy,
      {IRCIMIWClearMessagesCallback? callback}) async {
    throw UnimplementedError('clearMessages() has not been implemented.');
  }

  /// 删除本地消息
  /// - [messages] 消息集合
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onLocalMessagesDeleted]
  /// 此接口不支持 Flutter For Web 端
  Future<int> deleteLocalMessages(List<RCIMIWMessage> messages,
      {IRCIMIWDeleteLocalMessagesCallback? callback}) async {
    throw UnimplementedError('deleteLocalMessages() has not been implemented.');
  }

  /// 删除消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [messages] 消息集合
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessagesDeleted]
  Future<int> deleteMessages(RCIMIWConversationType type, String targetId,
      String? channelId, List<RCIMIWMessage> messages,
      {IRCIMIWDeleteMessagesCallback? callback}) async {
    throw UnimplementedError('deleteMessages() has not been implemented.');
  }

  /// 撤回消息
  /// - [message] 需要被撤回的消息
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessageRecalled]
  Future<int> recallMessage(RCIMIWMessage message,
      {IRCIMIWRecallMessageCallback? callback}) async {
    throw UnimplementedError('recallMessage() has not been implemented.');
  }

  /// 发送某个会话中的消息阅读回执
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 该会话中已读的最后一条消息的发送时间戳
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onPrivateReadReceiptMessageSent]
  Future<int> sendPrivateReadReceiptMessage(
      String targetId, String? channelId, int timestamp,
      {IRCIMIWSendPrivateReadReceiptMessageCallback? callback}) async {
    throw UnimplementedError(
        'sendPrivateReadReceiptMessage() has not been implemented.');
  }

  /// 发起群聊消息已读回执请求
  /// - [message] 需要请求已读回执的消息
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onGroupReadReceiptRequestSent]
  Future<int> sendGroupReadReceiptRequest(RCIMIWMessage message,
      {IRCIMIWSendGroupReadReceiptRequestCallback? callback}) async {
    throw UnimplementedError(
        'sendGroupReadReceiptRequest() has not been implemented.');
  }

  /// 发送群聊已读回执
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [messages] 会话中需要发送已读回执的消息列表
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onGroupReadReceiptResponseSent]
  Future<int> sendGroupReadReceiptResponse(
      String targetId, String? channelId, List<RCIMIWMessage> messages,
      {IRCIMIWSendGroupReadReceiptResponseCallback? callback}) async {
    throw UnimplementedError(
        'sendGroupReadReceiptResponse() has not been implemented.');
  }

  /// 更新消息扩展信息
  /// 每条消息携带扩展信息键值对最大值 300个，单次设置扩展信息键值对最大值 20个
  /// - [messageUId] 消息的 messageUid，可在消息对象中获取，且只有发送成功的消息才会有值
  /// - [expansion] 要更新的消息扩展信息键值对，类型是 HashMap；Key 支持大小写英文字母、数字、部分特殊符号 + = - _ 的组合方式，不支持汉字。Value 可以输入空格
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessageExpansionUpdated]
  Future<int> updateMessageExpansion(String messageUId, Map expansion,
      {IRCIMIWUpdateMessageExpansionCallback? callback}) async {
    throw UnimplementedError(
        'updateMessageExpansion() has not been implemented.');
  }

  /// 删除消息扩展信息中特定的键值对
  /// - [messageUId] 消息的 messageUid，可在消息对象中获取，且只有发送成功的消息才会有值
  /// - [keys]  消息扩展信息中待删除的 key 的列表，类型是 ArrayList
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessageExpansionForKeysRemoved]
  Future<int> removeMessageExpansionForKeys(
      String messageUId, List<String> keys,
      {IRCIMIWRemoveMessageExpansionForKeysCallback? callback}) async {
    throw UnimplementedError(
        'removeMessageExpansionForKeys() has not been implemented.');
  }

  /// 设置消息发送状态。
  /// - [messageId] 消息的 messageId，可在消息对象中获取
  /// - [sentStatus] 要修改的状态
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessageSentStatusChanged]
  /// 此接口不支持 Flutter For Web 端
  Future<int> changeMessageSentStatus(
      int messageId, RCIMIWSentStatus sentStatus,
      {IRCIMIWChangeMessageSentStatusCallback? callback}) async {
    throw UnimplementedError(
        'changeMessageSentStatus() has not been implemented.');
  }

  /// 设置消息接收状态。
  /// - [messageId] 消息的 messageId，可在消息对象中获取
  /// - [receivedStatus] 要修改的状态
  /// - [callback]  事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessageReceiveStatusChanged]
  /// 此接口不支持 Flutter For Web 端
  Future<int> changeMessageReceiveStatus(
      int messageId, RCIMIWReceivedStatus receivedStatus,
      {IRCIMIWChangeMessageReceivedStatusCallback? callback}) async {
    throw UnimplementedError(
        'changeMessageReceiveStatus() has not been implemented.');
  }

  /// 加入聊天室。
  /// - [targetId] 聊天室会话 ID
  /// - [messageCount] 进入聊天室拉取消息数目，-1 时不拉取任何消息，0 时拉取 10 条消息，最多只能拉取 50
  /// - [autoCreate] 是否创建聊天室，TRUE 如果聊天室不存在，sdk 会创建聊天室并加入，如果已存在，则直接加入
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onChatRoomJoined]
  Future<int> joinChatRoom(String targetId, int messageCount, bool autoCreate,
      {IRCIMIWJoinChatRoomCallback? callback}) async {
    throw UnimplementedError('joinChatRoom() has not been implemented.');
  }

  /// 退出聊天室。
  /// - [targetId] 聊天室会话 ID
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onChatRoomLeft]
  Future<int> leaveChatRoom(String targetId,
      {IRCIMIWLeaveChatRoomCallback? callback}) async {
    throw UnimplementedError('leaveChatRoom() has not been implemented.');
  }

  /// 加载聊天室历史消息记录。
  /// 注：必须先开通聊天室消息云存储功能。
  /// - [targetId] 聊天室会话 ID
  /// - [timestamp] 起始的消息发送时间戳
  /// - [order] 拉取顺序 0:倒序，1:正序
  /// - [count] 要获取的消息数量，0 < count <= 50。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onChatRoomMessagesLoaded]
  @Deprecated('请使用 [getChatRoomMessages] 代替')
  Future<int> loadChatRoomMessages(
      String targetId, int timestamp, RCIMIWTimeOrder order, int count) async {
    throw UnimplementedError(
        'loadChatRoomMessages() has not been implemented.');
  }

  /// 获取聊天室历史消息记录。
  /// 注：必须先开通聊天室消息云存储功能。
  /// - [targetId] 聊天室会话 ID
  /// - [timestamp] 起始的消息发送时间戳
  /// - [order] 拉取顺序 0:倒序，1:正序
  /// - [count] 要获取的消息数量，0 < count <= 50。
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onChatRoomMessagesLoaded]
  Future<int> getChatRoomMessages(
      String targetId, int timestamp, RCIMIWTimeOrder order, int count,
      {IRCIMIWGetChatRoomMessagesCallback? callback}) async {
    throw UnimplementedError('getChatRoomMessages() has not been implemented.');
  }

  /// 设置聊天室自定义属性。
  /// - [targetId] 聊天室会话 ID
  /// - [key]  聊天室属性名称，Key 支持大小写英文字母、数字、部分特殊符号 + = - _ 的组合方式，最大长度 128 个字符
  /// - [value]     聊天室属性对应的值，最大长度 4096 个字符
  /// - [deleteWhenLeft] 用户掉线或退出时，是否自动删除该 Key、Value 值
  /// - [overwrite] 如果当前 key 存在，是否进行覆盖
  /// - [callback]  事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onChatRoomEntryAdded]
  Future<int> addChatRoomEntry(String targetId, String key, String value,
      bool deleteWhenLeft, bool overwrite,
      {IRCIMIWAddChatRoomEntryCallback? callback}) async {
    throw UnimplementedError('addChatRoomEntry() has not been implemented.');
  }

  /// 批量设置聊天室自定义属性
  /// - [targetId] 聊天室会话 ID
  /// - [entries]   聊天室属性
  /// - [deleteWhenLeft] 用户掉线或退出时，是否自动删除该 Key、Value 值
  /// - [overwrite] 是否强制覆盖
  /// - [callback]  事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onChatRoomEntriesAdded]
  Future<int> addChatRoomEntries(
      String targetId, Map entries, bool deleteWhenLeft, bool overwrite,
      {IRCIMIWAddChatRoomEntriesCallback? callback}) async {
    throw UnimplementedError('addChatRoomEntries() has not been implemented.');
  }

  /// 加载聊天室单个属性。
  /// - [targetId] 聊天室会话 ID
  /// - [key] 聊天室属性键值
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onChatRoomEntryLoaded]
  @Deprecated('请使用 [getChatRoomEntry] 代替')
  Future<int> loadChatRoomEntry(String targetId, String key) async {
    throw UnimplementedError('loadChatRoomEntry() has not been implemented.');
  }

  /// 获取聊天室单个属性。
  /// - [targetId] 聊天室会话 ID
  /// - [key] 聊天室属性键值
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onChatRoomEntryLoaded]
  Future<int> getChatRoomEntry(String targetId, String key,
      {IRCIMIWGetChatRoomEntryCallback? callback}) async {
    throw UnimplementedError('getChatRoomEntry() has not been implemented.');
  }

  /// 加载聊天室所有属性。
  /// - [targetId] 聊天室会话 ID
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onChatRoomAllEntriesLoaded]
  @Deprecated('请使用 [getChatRoomAllEntries] 代替')
  Future<int> loadChatRoomAllEntries(String targetId) async {
    throw UnimplementedError(
        'loadChatRoomAllEntries() has not been implemented.');
  }

  /// 获取聊天室所有属性。
  /// - [targetId] 聊天室会话 ID
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onChatRoomAllEntriesLoaded]
  Future<int> getChatRoomAllEntries(String targetId,
      {IRCIMIWGetChatRoomAllEntriesCallback? callback}) async {
    throw UnimplementedError(
        'getChatRoomAllEntries() has not been implemented.');
  }

  /// 删除聊天室自定义属性。
  /// - [targetId] 聊天室会话 ID
  /// - [key] 聊天室属性键值
  /// - [force] 是否强制删除
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onChatRoomEntryRemoved]
  Future<int> removeChatRoomEntry(String targetId, String key, bool force,
      {IRCIMIWRemoveChatRoomEntryCallback? callback}) async {
    throw UnimplementedError('removeChatRoomEntry() has not been implemented.');
  }

  /// 批量删除聊天室自定义属性
  /// - [targetId] 聊天室会话 ID
  /// - [keys] 聊天室属性
  /// - [force] 是否强制覆盖
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onChatRoomEntriesRemoved]
  Future<int> removeChatRoomEntries(
      String targetId, List<String> keys, bool force,
      {IRCIMIWRemoveChatRoomEntriesCallback? callback}) async {
    throw UnimplementedError(
        'removeChatRoomEntries() has not been implemented.');
  }

  /// 将某个用户加入黑名单。
  /// 当你把对方加入黑名单后，对方再发消息时，就会提示“已被加入黑名单，消息发送失败”。 但你依然可以发消息个对方。
  /// - [userId] 用户 Id
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onBlacklistAdded]
  /// 此接口不支持 Flutter For Web 端
  Future<int> addToBlacklist(String userId,
      {IRCIMIWAddToBlacklistCallback? callback}) async {
    throw UnimplementedError('addToBlacklist() has not been implemented.');
  }

  /// 将某个用户从黑名单中移出。
  /// - [userId] 用户 Id
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onBlacklistRemoved]
  /// 此接口不支持 Flutter For Web 端
  Future<int> removeFromBlacklist(String userId,
      {IRCIMIWRemoveFromBlacklistCallback? callback}) async {
    throw UnimplementedError('removeFromBlacklist() has not been implemented.');
  }

  /// 获取某用户是否在黑名单中。
  /// - [userId] 用户 Id
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onBlacklistStatusLoaded]
  /// 此接口不支持 Flutter For Web 端
  @Deprecated('请使用 [getBlacklistStatus] 代替')
  Future<int> loadBlacklistStatus(String userId) async {
    throw UnimplementedError('loadBlacklistStatus() has not been implemented.');
  }

  /// 获取某用户是否在黑名单中。
  /// - [userId] 用户 Id
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onBlacklistStatusLoaded]
  /// 此接口不支持 Flutter For Web 端
  Future<int> getBlacklistStatus(String userId,
      {IRCIMIWGetBlacklistStatusCallback? callback}) async {
    throw UnimplementedError('getBlacklistStatus() has not been implemented.');
  }

  /// 加载当前用户设置的黑名单列表。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onBlacklistLoaded]
  /// 此接口不支持 Flutter For Web 端
  @Deprecated('请使用 [getBlacklist] 代替')
  Future<int> loadBlacklist() async {
    throw UnimplementedError('loadBlacklist() has not been implemented.');
  }

  /// 获取当前用户设置的黑名单列表。
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onBlacklistLoaded]
  /// 此接口不支持 Flutter For Web 端
  Future<int> getBlacklist({IRCIMIWGetBlacklistCallback? callback}) async {
    throw UnimplementedError('getBlacklist() has not been implemented.');
  }

  /// 根据关键字搜索指定会话中的消息。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [keyword] 搜索的关键字
  /// - [startTime] 查询 beginTime 之前的消息， 传 0 时从最新消息开始搜索，从该时间往前搜索。
  /// - [count] 查询的数量，0 < count <= 50。
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessagesSearched]
  /// 此接口不支持 Flutter For Web 端
  Future<int> searchMessages(RCIMIWConversationType type, String targetId,
      String? channelId, String keyword, int startTime, int count,
      {IRCIMIWSearchMessagesCallback? callback}) async {
    throw UnimplementedError('searchMessages() has not been implemented.');
  }

  /// 根据关键字搜索指定会话中某个时间段的消息。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [keyword] 搜索的关键字
  /// - [startTime] 开始时间
  /// - [endTime] 结束时间
  /// - [offset] 偏移量
  /// - [count] 返回的搜索结果数量，0 < count <= 50。
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessagesSearchedByTimeRange]
  /// 此接口不支持 Flutter For Web 端
  Future<int> searchMessagesByTimeRange(
      RCIMIWConversationType type,
      String targetId,
      String? channelId,
      String keyword,
      int startTime,
      int endTime,
      int offset,
      int count,
      {IRCIMIWSearchMessagesByTimeRangeCallback? callback}) async {
    throw UnimplementedError(
        'searchMessagesByTimeRange() has not been implemented.');
  }

  /// 根据用户 id 搜索指定会话中的消息。
  /// - [userId] 用户 id
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [startTime] 查询记录的起始时间， 传 0 时从最新消息开始搜索，从该时间往前搜索。
  /// - [count] 返回的搜索结果数量 0 < count <= 50。
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessagesSearchedByUserId]
  /// 此接口不支持 Flutter For Web 端
  Future<int> searchMessagesByUserId(String userId, RCIMIWConversationType type,
      String targetId, String? channelId, int startTime, int count,
      {IRCIMIWSearchMessagesByUserIdCallback? callback}) async {
    throw UnimplementedError(
        'searchMessagesByUserId() has not been implemented.');
  }

  /// 根据关键字搜索会话。
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [messageTypes] 搜索的消息类型
  /// - [keyword]      搜索的关键字。
  /// - [callback]     事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationsSearched]
  /// 此接口不支持 Flutter For Web 端
  Future<int> searchConversations(
      List<RCIMIWConversationType> conversationTypes,
      String? channelId,
      List<RCIMIWMessageType> messageTypes,
      String keyword,
      {IRCIMIWSearchConversationsCallback? callback}) async {
    throw UnimplementedError('searchConversations() has not been implemented.');
  }

  /// 屏蔽某个时间段的消息提醒
  /// - [startTime] 开始消息免打扰时间，格式为 HH:MM:SS
  /// - [spanMinutes] 需要消息免打扰分钟数，0 < spanMinutes < 1440（ 比如，您设置的起始时间是 00：00， 结束时间为 01:00，则 spanMinutes 为 60 分钟。设置为 1439 代表全天免打扰 （23 60 + 59 = 1439 ））
  /// - [level]  消息通知级别
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onNotificationQuietHoursChanged]
  /// 此接口不支持 Flutter For Web 端
  Future<int> changeNotificationQuietHours(String startTime, int spanMinutes,
      RCIMIWPushNotificationQuietHoursLevel level,
      {IRCIMIWChangeNotificationQuietHoursCallback? callback}) async {
    throw UnimplementedError(
        'changeNotificationQuietHours() has not been implemented.');
  }

  /// 删除已设置的全局时间段消息提醒屏蔽
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onNotificationQuietHoursRemoved]
  /// 此接口不支持 Flutter For Web 端
  Future<int> removeNotificationQuietHours(
      {IRCIMIWRemoveNotificationQuietHoursCallback? callback}) async {
    throw UnimplementedError(
        'removeNotificationQuietHours() has not been implemented.');
  }

  /// 加载已设置的时间段消息提醒屏蔽
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onNotificationQuietHoursLoaded]
  /// 此接口不支持 Flutter For Web 端
  @Deprecated('请使用 [getNotificationQuietHours] 代替')
  Future<int> loadNotificationQuietHours() async {
    throw UnimplementedError(
        'loadNotificationQuietHours() has not been implemented.');
  }

  /// 获取已设置的时间段消息提醒屏蔽
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onNotificationQuietHoursLoaded]
  /// 此接口不支持 Flutter For Web 端
  Future<int> getNotificationQuietHours(
      {IRCIMIWGetNotificationQuietHoursCallback? callback}) async {
    throw UnimplementedError(
        'getNotificationQuietHours() has not been implemented.');
  }

  /// 设置会话的消息提醒状态
  /// 注：超级群调用该接口，channelId 为空时，相当于设置了 channelId 为空的频道的免打扰，不会屏蔽整个超级群会话下所有频道的免打扰
  /// - [type] 会话类型。请注意以下限制：<ul><li>*超级群会话类型*：如在 2022.09.01 之前开通超级群业务，默认不支持为单个超级群会话*所有消息*设置免打扰级别（“所有消息”指所有频道中的消息和不属于任何频道的消息）。该接口仅设置指定超级群会话（`targetId`）中*不属于任何频道的消息*的免打扰状态级别。如需修改请提交工单。</li><li>*聊天室会话类型*：不支持，因为聊天室消息默认不支持消息推送提醒。</li></ul>
  /// - [targetId] 会话 ID
  /// - [channelId] 超级群的会话频道 ID。其他类型传 null 即可。<ul><li>如果传入频道 ID，则针对该指定频道设置消息免打扰级别。如果不指定频道 ID，则对所有超级群消息生效。</li><li>*注意*：2022.09.01 之前开通超级群业务的客户，如果不指定频道 ID，则默认传 "" 空字符串，即仅针对指定超级群会话（`targetId`）中*不属于任何频道的消息*设置免打扰状态级别。如需修改请提交工单。</p></li></ul>
  /// - [level] 消息通知级别
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationNotificationLevelChanged]
  Future<int> changeConversationNotificationLevel(RCIMIWConversationType type,
      String targetId, String? channelId, RCIMIWPushNotificationLevel level,
      {IRCIMIWChangeConversationNotificationLevelCallback? callback}) async {
    throw UnimplementedError(
        'changeConversationNotificationLevel() has not been implemented.');
  }

  /// 加载会话的消息提醒状态
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationNotificationLevelLoaded]
  @Deprecated('请使用 [getConversationNotificationLevel] 代替')
  Future<int> loadConversationNotificationLevel(
      RCIMIWConversationType type, String targetId, String? channelId) async {
    throw UnimplementedError(
        'loadConversationNotificationLevel() has not been implemented.');
  }

  /// 获取会话的消息提醒状态
  /// - [type] 会话类型。请注意以下限制：<ul><li>*超级群会话类型*：如在 2022.09.01 之前开通超级群业务，默认不支持为单个超级群会话*所有消息*设置免打扰级别（“所有消息”指所有频道中的消息和不属于任何频道的消息）。该接口仅设置指定超级群会话（`targetId`）中*不属于任何频道的消息*的免打扰状态级别。如需修改请提交工单。</li><li>*聊天室会话类型*：不支持，因为聊天室消息默认不支持消息推送提醒。</li></ul>
  /// - [targetId] 会话 ID
  /// - [channelId] 超级群的会话频道 ID。其他类型传 null 即可。<ul><li>如果传入频道 ID，则针对该指定频道设置消息免打扰级别。如果不指定频道 ID，则对所有超级群消息生效。</li><li>*注意*：2022.09.01 之前开通超级群业务的客户，如果不指定频道 ID，则默认传 "" 空字符串，即仅针对指定超级群会话（`targetId`）中*不属于任何频道的消息*设置免打扰状态级别。如需修改请提交工单。</p></li></ul>
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationNotificationLevelLoaded]
  Future<int> getConversationNotificationLevel(
      RCIMIWConversationType type, String targetId, String? channelId,
      {IRCIMIWGetConversationNotificationLevelCallback? callback}) async {
    throw UnimplementedError(
        'getConversationNotificationLevel() has not been implemented.');
  }

  /// 设置会话类型的消息提醒状态
  /// 注：如要移除消息提醒状态，设置level为RCIMIWPushNotificationLevelDefault
  /// - [type] 会话类型
  /// - [level] 消息通知级别
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationTypeNotificationLevelChanged]
  Future<int> changeConversationTypeNotificationLevel(
      RCIMIWConversationType type, RCIMIWPushNotificationLevel level,
      {IRCIMIWChangeConversationTypeNotificationLevelCallback?
          callback}) async {
    throw UnimplementedError(
        'changeConversationTypeNotificationLevel() has not been implemented.');
  }

  /// 获取会话类型的消息提醒状态
  /// - [type] 会话类型
  /// - [返回值] [onConversationTypeNotificationLevelLoaded]
  @Deprecated('请使用 [getConversationTypeNotificationLevel] 代替')
  Future<int> loadConversationTypeNotificationLevel(
      RCIMIWConversationType type) async {
    throw UnimplementedError(
        'loadConversationTypeNotificationLevel() has not been implemented.');
  }

  /// 获取会话类型的消息提醒状态
  /// - [type] 会话类型
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] [onConversationTypeNotificationLevelLoaded]
  Future<int> getConversationTypeNotificationLevel(RCIMIWConversationType type,
      {IRCIMIWGetConversationTypeNotificationLevelCallback? callback}) async {
    throw UnimplementedError(
        'getConversationTypeNotificationLevel() has not been implemented.');
  }

  /// 设置超级群的默认消息状态
  /// 一般由管理员设置的接口，针对超级群的所有群成员生效，针对超级群下所有频道生效，优先级较低。如果群成员自己超级群的免打扰级别，那么以群成员自己设置的为准。
  /// - [targetId] 会话 ID
  /// - [level] 消息通知级别
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupDefaultNotificationLevelChanged]
  Future<int> changeUltraGroupDefaultNotificationLevel(
      String targetId, RCIMIWPushNotificationLevel level,
      {IRCIMIWChangeUltraGroupDefaultNotificationLevelCallback?
          callback}) async {
    throw UnimplementedError(
        'changeUltraGroupDefaultNotificationLevel() has not been implemented.');
  }

  /// 获取超级群的默认消息状态
  /// - [targetId] 会话 ID
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupDefaultNotificationLevelLoaded]
  @Deprecated('请使用 [getUltraGroupDefaultNotificationLevel] 代替')
  Future<int> loadUltraGroupDefaultNotificationLevel(String targetId) async {
    throw UnimplementedError(
        'loadUltraGroupDefaultNotificationLevel() has not been implemented.');
  }

  /// 获取超级群的默认消息状态
  /// - [targetId] 会话 ID
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupDefaultNotificationLevelLoaded]
  Future<int> getUltraGroupDefaultNotificationLevel(String targetId,
      {IRCIMIWGetUltraGroupDefaultNotificationLevelCallback? callback}) async {
    throw UnimplementedError(
        'getUltraGroupDefaultNotificationLevel() has not been implemented.');
  }

  /// 设置超级群频道的默认消息状态
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用。
  /// - [level] 消息通知级别
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupChannelDefaultNotificationLevelChanged]
  Future<int> changeUltraGroupChannelDefaultNotificationLevel(
      String targetId, String? channelId, RCIMIWPushNotificationLevel level,
      {IRCIMIWChangeUltraGroupChannelDefaultNotificationLevelCallback?
          callback}) async {
    throw UnimplementedError(
        'changeUltraGroupChannelDefaultNotificationLevel() has not been implemented.');
  }

  /// 获取超级群频道的默认消息状态
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupChannelDefaultNotificationLevelLoaded]
  @Deprecated('请使用 [getUltraGroupChannelDefaultNotificationLevel] 代替')
  Future<int> loadUltraGroupChannelDefaultNotificationLevel(
      String targetId, String? channelId) async {
    throw UnimplementedError(
        'loadUltraGroupChannelDefaultNotificationLevel() has not been implemented.');
  }

  /// 获取超级群频道的默认消息状态
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用。
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupChannelDefaultNotificationLevelLoaded]
  Future<int> getUltraGroupChannelDefaultNotificationLevel(
      String targetId, String? channelId,
      {IRCIMIWGetUltraGroupChannelDefaultNotificationLevelCallback?
          callback}) async {
    throw UnimplementedError(
        'getUltraGroupChannelDefaultNotificationLevel() has not been implemented.');
  }

  /// 设置是否显示远程推送内容详情，此功能需要从服务端开启用户设置功能。
  /// - [showContent] 是否显示远程推送内容
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onPushContentShowStatusChanged]
  Future<int> changePushContentShowStatus(bool showContent,
      {IRCIMIWChangePushContentShowStatusCallback? callback}) async {
    throw UnimplementedError(
        'changePushContentShowStatus() has not been implemented.');
  }

  /// 设置推送语言
  /// - [language] 推送语言， 目前仅支持 en_us、zh_cn、ar_sa
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onPushLanguageChanged]
  /// 此接口不支持 Flutter For Web 端
  Future<int> changePushLanguage(String language,
      {IRCIMIWChangePushLanguageCallback? callback}) async {
    throw UnimplementedError('changePushLanguage() has not been implemented.');
  }

  /// 设置是否接收远程推送。
  /// 前提：移动端未在线，Web 、MAC/PC 终端在线，移动端是否接收远程推送。
  /// 此功能需要从服务端开启用户设置功能。
  /// - [receive] 是否接收
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onPushReceiveStatusChanged]
  /// 此接口不支持 Flutter For Web 端
  Future<int> changePushReceiveStatus(bool receive,
      {IRCIMIWChangePushReceiveStatusCallback? callback}) async {
    throw UnimplementedError(
        'changePushReceiveStatus() has not been implemented.');
  }

  /// 给指定的群成员发送消息
  /// - [message] 要发送的消息
  /// - [userIds] 群成员集合
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onGroupMessageToDesignatedUsersAttached], [onGroupMessageToDesignatedUsersSent]
  Future<int> sendGroupMessageToDesignatedUsers(
      RCIMIWMessage message, List<String> userIds,
      {RCIMIWSendGroupMessageToDesignatedUsersCallback? callback}) async {
    throw UnimplementedError(
        'sendGroupMessageToDesignatedUsers() has not been implemented.');
  }

  /// 加载指定会话的消息总数。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessageCountLoaded]
  /// 此接口不支持 Flutter For Web 端
  @Deprecated('请使用 [getMessageCount] 代替')
  Future<int> loadMessageCount(
      RCIMIWConversationType type, String targetId, String? channelId) async {
    throw UnimplementedError('loadMessageCount() has not been implemented.');
  }

  /// 获取指定会话的消息总数。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessageCountLoaded]
  /// 此接口不支持 Flutter For Web 端
  Future<int> getMessageCount(
      RCIMIWConversationType type, String targetId, String? channelId,
      {IRCIMIWGetMessageCountCallback? callback}) async {
    throw UnimplementedError('getMessageCount() has not been implemented.');
  }

  /// 根据会话类型,加载置顶会话列表
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onTopConversationsLoaded]
  @Deprecated('请使用 [getTopConversations] 代替')
  Future<int> loadTopConversations(
      List<RCIMIWConversationType> conversationTypes, String? channelId) async {
    throw UnimplementedError(
        'loadTopConversations() has not been implemented.');
  }

  /// 根据会话类型,获取置顶会话列表
  /// - [conversationTypes] 会话类型集合
  /// - [channelId]    频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [callback]     事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onTopConversationsLoaded]
  Future<int> getTopConversations(
      List<RCIMIWConversationType> conversationTypes, String? channelId,
      {IRCIMIWGetTopConversationsCallback? callback}) async {
    throw UnimplementedError('getTopConversations() has not been implemented.');
  }

  /// 上报超级群的已读时间
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用。
  /// - [timestamp] 已读时间
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupReadStatusSynced]
  /// [timestamp] 在 Flutter For Web 端无效
  Future<int> syncUltraGroupReadStatus(
      String targetId, String? channelId, int timestamp,
      {IRCIMIWSyncUltraGroupReadStatusCallback? callback}) async {
    throw UnimplementedError(
        'syncUltraGroupReadStatus() has not been implemented.');
  }

  /// 获取特定会话下所有频道的会话列表，只支持超级群
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationsLoadedForAllChannel]
  @Deprecated('请使用 [getConversationsForAllChannel] 代替')
  Future<int> loadConversationsForAllChannel(
      RCIMIWConversationType type, String targetId) async {
    throw UnimplementedError(
        'loadConversationsForAllChannel() has not been implemented.');
  }

  /// 获取特定会话下所有频道的会话列表，只支持超级群
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onConversationsLoadedForAllChannel]
  Future<int> getConversationsForAllChannel(
      RCIMIWConversationType type, String targetId,
      {IRCIMIWGetConversationsForAllChannelCallback? callback}) async {
    throw UnimplementedError(
        'getConversationsForAllChannel() has not been implemented.');
  }

  /// 修改超级群消息
  /// - [messageUId] 消息的 messageUid，可在消息对象中获取，且只有发送成功的消息才会有值
  /// - [message] 要修改的 message
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupMessageModified]
  Future<int> modifyUltraGroupMessage(String messageUId, RCIMIWMessage message,
      {IRCIMIWModifyUltraGroupMessageCallback? callback}) async {
    throw UnimplementedError(
        'modifyUltraGroupMessage() has not been implemented.');
  }

  /// 撤回超级群消息
  /// - [message] 需要撤回的消息
  /// - [deleteRemote] 是否删除远端消息
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupMessageRecalled]
  Future<int> recallUltraGroupMessage(RCIMIWMessage message, bool deleteRemote,
      {IRCIMIWRecallUltraGroupMessageCallback? callback}) async {
    throw UnimplementedError(
        'recallUltraGroupMessage() has not been implemented.');
  }

  /// 删除超级群指定时间之前的消息
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用。
  /// - [timestamp] 时间戳
  /// - [policy] 清除策略
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupMessagesCleared]
  Future<int> clearUltraGroupMessages(String targetId, String? channelId,
      int timestamp, RCIMIWMessageOperationPolicy policy,
      {IRCIMIWClearUltraGroupMessagesCallback? callback}) async {
    throw UnimplementedError(
        'clearUltraGroupMessages() has not been implemented.');
  }

  /// 发送超级群输入状态
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用。
  /// - [typingStatus] 输入状态
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupTypingStatusSent]
  Future<int> sendUltraGroupTypingStatus(String targetId, String? channelId,
      RCIMIWUltraGroupTypingStatus typingStatus,
      {IRCIMIWSendUltraGroupTypingStatusCallback? callback}) async {
    throw UnimplementedError(
        'sendUltraGroupTypingStatus() has not been implemented.');
  }

  /// 删除超级群所有频道指定时间之前的消息
  /// - [targetId] 会话 ID
  /// - [timestamp] 时间戳
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupMessagesClearedForAllChannel]
  Future<int> clearUltraGroupMessagesForAllChannel(
      String targetId, int timestamp,
      {IRCIMIWClearUltraGroupMessagesForAllChannelCallback? callback}) async {
    throw UnimplementedError(
        'clearUltraGroupMessagesForAllChannel() has not been implemented.');
  }

  /// 从服务获取批量消息
  /// - [messages] 获取的消息集合
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onBatchRemoteUltraGroupMessagesLoaded]
  @Deprecated('请使用 [getBatchRemoteUltraGroupMessages] 代替')
  Future<int> loadBatchRemoteUltraGroupMessages(
      List<RCIMIWMessage> messages) async {
    throw UnimplementedError(
        'loadBatchRemoteUltraGroupMessages() has not been implemented.');
  }

  /// 从服务获取批量消息
  /// - [messages] 获取的消息集合
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onBatchRemoteUltraGroupMessagesLoaded]
  Future<int> getBatchRemoteUltraGroupMessages(List<RCIMIWMessage> messages,
      {IRCIMIWGetBatchRemoteUltraGroupMessagesCallback? callback}) async {
    throw UnimplementedError(
        'getBatchRemoteUltraGroupMessages() has not been implemented.');
  }

  /// 更新超级群消息扩展信息
  /// - [messageUId] 消息的 messageUid，可在消息对象中获取，且只有发送成功的消息才会有值
  /// - [expansion] 更新的消息扩展信息键值对，类型是 HashMap；Key 支持大小写英文字母、数字、部分特殊符号 + = - _ 的组合方式，不支持汉字。Value 可以输入空格。
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupMessageExpansionUpdated]
  Future<int> updateUltraGroupMessageExpansion(String messageUId, Map expansion,
      {IRCIMIWUpdateUltraGroupMessageExpansionCallback? callback}) async {
    throw UnimplementedError(
        'updateUltraGroupMessageExpansion() has not been implemented.');
  }

  /// 删除超级群消息扩展信息中特定的键值对
  /// - [messageUId] 消息的 messageUid，可在消息对象中获取，且只有发送成功的消息才会有值
  /// - [keys]  消息扩展信息中待删除的 key 的列表，类型是 ArrayList
  /// - [callback] 事件回调。SDK 从 5.3.1 版本开始支持 callback 方式回调。从 5.4.0 版本废弃该接口的其他回调方式，预计将在 6.x 版本删除此其他回调方式。如果传入了 callback 参数，仅触发 callback 回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupMessageExpansionForKeysRemoved]
  Future<int> removeUltraGroupMessageExpansionForKeys(
      String messageUId, List<String> keys,
      {IRCIMIWRemoveUltraGroupMessageExpansionForKeysCallback?
          callback}) async {
    throw UnimplementedError(
        'removeUltraGroupMessageExpansionForKeys() has not been implemented.');
  }

  /// 修改日志等级
  /// - [level] 日志级别
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// 此接口不支持 Flutter For Web 端
  Future<int> changeLogLevel(RCIMIWLogLevel level) async {
    throw UnimplementedError('changeLogLevel() has not been implemented.');
  }

  /// 获取本地时间与服务器时间的时间差。消息发送成功后，SDK 与服务器同步时间，消息所在数据库中存储的时间就是服务器时间。 System.currentTimeMillis() - getDeltaTime() 可以获取服务器当前时间。
  /// - [返回值] 本地时间与服务器时间的差值
  Future<int> getDeltaTime() async {
    throw UnimplementedError('getDeltaTime() has not been implemented.');
  }

  /// 创建标签信息
  /// - [tagId] 标签唯一标识，字符型，长度不超过 10 个字。
  /// - [tagName] 长度不超过 15 个字，标签名称可以重复。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> createTag(String tagId, String tagName,
      {IRCIMIWCreateTagCallback? callback}) async {
    throw UnimplementedError('createTag() has not been implemented.');
  }

  /// 移除标签
  /// - [tagId] 标签唯一标识，字符型，长度不超过 10 个字。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> removeTag(String tagId,
      {IRCIMIWRemoveTagCallback? callback}) async {
    throw UnimplementedError('removeTag() has not been implemented.');
  }

  /// 更新标签信息
  /// - [tagId] 标签唯一标识，字符型，长度不超过 10 个字。
  /// - [newName] 长度不超过 15 个字，标签名称可以重复。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> updateTagNameById(String tagId, String newName,
      {IRCIMIWUpdateTagNameByIdCallback? callback}) async {
    throw UnimplementedError('updateTagNameById() has not been implemented.');
  }

  /// 获取当前用户已创建的标签信息
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> getTags({IRCIMIWGetTagsCallback? callback}) async {
    throw UnimplementedError('getTags() has not been implemented.');
  }

  /// 将一个会话添加到指定标签
  /// - [tagId] 标签唯一标识，字符型，长度不超过 10 个字。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> addConversationToTag(
      String tagId, RCIMIWConversationType type, String targetId,
      {IRCIMIWAddConversationToTagCallback? callback}) async {
    throw UnimplementedError(
        'addConversationToTag() has not been implemented.');
  }

  /// 从标签中移除一个会话
  /// - [tagId] 标签唯一标识，字符型，长度不超过 10 个字。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> removeConversationFromTag(
      String tagId, RCIMIWConversationType type, String targetId,
      {IRCIMIWRemoveConversationFromTagCallback? callback}) async {
    throw UnimplementedError(
        'removeConversationFromTag() has not been implemented.');
  }

  /// 为指定会话移除一个或多个标签
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [tagIds] 标签集合
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> removeTagsFromConversation(
      RCIMIWConversationType type, String targetId, List<String> tagIds,
      {IRCIMIWRemoveTagsFromConversationCallback? callback}) async {
    throw UnimplementedError(
        'removeTagsFromConversation() has not been implemented.');
  }

  /// 获取指定会话携带的所有标签
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> getTagsFromConversation(
      RCIMIWConversationType type, String targetId,
      {IRCIMIWGetTagsFromConversationCallback? callback}) async {
    throw UnimplementedError(
        'getTagsFromConversation() has not been implemented.');
  }

  /// 以会话中最后一条消息时间戳为界，分页获取本地指定标签下会话列表
  /// - [tagId] 标签唯一标识，字符型，长度不超过 10 个字。
  /// - [timestamp] 会话的时间戳。获取这个时间戳之前的会话列表。首次可传 0，后续可以使用返回的 RCConversation 对象的 operationTime 属性值，作为下一次查询的 startTime。
  /// - [count] 获取的数量。当实际取回的会话数量小于 count 值时，表明已取完数据。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> getConversationsFromTagByPage(
      String tagId, int timestamp, int count,
      {IRCIMIWGetConversationsCallback? callback}) async {
    throw UnimplementedError(
        'getConversationsFromTagByPage() has not been implemented.');
  }

  /// 获取携带指定标签的所有会话的未读消息数。
  /// - [tagId] 标签唯一标识，字符型，长度不超过 10 个字。
  /// - [contain] 是否包含免打扰会话。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> getUnreadCountByTag(String tagId, bool contain,
      {IRCIMIWGetUnreadCountCallback? callback}) async {
    throw UnimplementedError('getUnreadCountByTag() has not been implemented.');
  }

  /// 在携带指定标签的所有会话中设置指定会话置顶。例如，在所有添加了「培训班」标签的会话中将与「Tom」的私聊会话置顶。
  /// - [tagId] 标签唯一标识，字符型，长度不超过 10 个字。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [top] 是否置顶
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> changeConversationTopStatusInTag(
      String tagId, RCIMIWConversationType type, String targetId, bool top,
      {IRCIMIWChangeConversationTopStatusInTagCallback? callback}) async {
    throw UnimplementedError(
        'changeConversationTopStatusInTag() has not been implemented.');
  }

  /// 查询指定会话是否在携带同一标签的所有会话中置顶。获取成功后会返回是否已置顶。
  /// - [tagId] 标签唯一标识，字符型，长度不超过 10 个字。
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> getConversationTopStatusInTag(
      String tagId, RCIMIWConversationType type, String targetId,
      {IRCIMIWGetConversationTopStatusInTagCallback? callback}) async {
    throw UnimplementedError(
        'getConversationTopStatusInTag() has not been implemented.');
  }

  /// 清除携带指定标签的所有会话的未读消息数。
  /// - [tagId] 标签唯一标识，字符型，长度不超过 10 个字。
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> clearMessagesUnreadStatusByTag(String tagId,
      {IRCIMIWClearMessagesUnreadStatusByTagCallback? callback}) async {
    throw UnimplementedError(
        'clearMessagesUnreadStatusByTag() has not been implemented.');
  }

  /// 删除指定标签下的全部会话，同时解除这些会话和标签的绑定关系。删除成功后，会话不再携带指定的标签。这些会话收到新消息时，会产生新的会话。
  /// - [tagId] 标签唯一标识，字符型，长度不超过 10 个字。
  /// - [deleteMessage] 是否删除消息
  /// - [callback] 事件回调。
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  Future<int> clearConversationsByTag(String tagId, bool deleteMessage,
      {IRCIMIWClearConversationsByTagCallback? callback}) async {
    throw UnimplementedError(
        'clearConversationsByTag() has not been implemented.');
  }

  // -------- web 专有的方法 --------

  /// 构建语音消息 (高清语音)，发送成功后会根据文件自动生成 duration
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [file] 语音文件节点
  /// - [duration] 语音消息的消息时长
  /// - [返回值] 语音消息的实体
  Future<RCIMIWVoiceMessage?> createVoiceMessageForWeb(
      RCIMIWConversationType type,
      String targetId,
      String? channelId,
      dynamic file) async {
    throw UnimplementedError(
        'createVoiceMessageForWeb() has not been implemented.');
  }

  /// 构建图片消息，发送成功后会根据文件自动生成缩略图
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [file] 图片文件节点
  /// - [返回值] 图片消息实体
  Future<RCIMIWImageMessage?> createImageMessageForWeb(
      RCIMIWConversationType type,
      String targetId,
      String? channelId,
      dynamic file) async {
    throw UnimplementedError(
        'createImageMessageForWeb() has not been implemented.');
  }

  /// 构建文件消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [file] 文件节点
  /// - [返回值] 文件消息实体
  Future<RCIMIWFileMessage?> createFileMessageForWeb(
      RCIMIWConversationType type,
      String targetId,
      String? channelId,
      dynamic file) async {
    throw UnimplementedError(
        'createFileMessageForWeb() has not been implemented.');
  }

  /// 构建小视频消息， 发送成功后会根据文件自动生成 duration 和 缩略图
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [file] 小视频文件节点
  /// - [返回值] 视频消息实体
  Future<RCIMIWSightMessage?> createSightMessageForWeb(
      RCIMIWConversationType type,
      String targetId,
      String? channelId,
      dynamic file) async {
    throw UnimplementedError(
        'createSightMessageForWeb() has not been implemented.');
  }

  /// 构建 GIF 消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [file] GIF 文件节点
  /// - [返回值] GIF 消息实体
  Future<RCIMIWGIFMessage> createGIFMessageForWeb(RCIMIWConversationType type,
      String targetId, String? channelId, dynamic file) {
    throw UnimplementedError(
        'createGIFMessageForWeb() has not been implemented.');
  }

  /// 构建位置消息
  /// - [type] 会话类型
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [longitude] 经度
  /// - [latitude] 纬度
  /// - [poiName]  POI 信息
  /// - [thumbnailBase64] 缩略图 base64 字符串
  /// - [返回值] 位置消息实体
  Future<RCIMIWLocationMessage?> createLocationMessageForWeb(
      RCIMIWConversationType type,
      String targetId,
      String? channelId,
      double longitude,
      double latitude,
      String poiName,
      String thumbnailBase64) async {
    throw UnimplementedError(
        'createLocationMessageForWeb() has not been implemented.');
  }

  /// 更新消息扩展信息
  /// 每条消息携带扩展信息键值对最大值 300个，单次设置扩展信息键值对最大值 20个
  /// - [message] 已发送的消息
  /// - [expansion] 要更新的消息扩展信息键值对，类型是 HashMap；Key 支持大小写英文字母、数字、部分特殊符号 + = - _ 的组合方式，不支持汉字。Value 可以输入空格
  /// - [callback] 事件回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessageExpansionUpdated]
  Future<int> updateMessageExpansionForWeb(RCIMIWMessage message, Map expansion,
      {IRCIMIWUpdateMessageExpansionCallback? callback}) async {
    throw UnimplementedError(
        'updateMessageExpansionForWeb() has not been implemented.');
  }

  /// 删除消息扩展信息中特定的键值对
  /// - [message] 已发送的消息
  /// - [keys]  消息扩展信息中待删除的 key 的列表，类型是 ArrayList
  /// - [callback] 事件回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onMessageExpansionForKeysRemoved]
  Future<int> removeMessageExpansionForKeysForWeb(
      RCIMIWMessage message, List<String> keys,
      {IRCIMIWRemoveMessageExpansionForKeysCallback? callback}) async {
    return await RCIMWrapperPlatform.instance
        .removeMessageExpansionForKeysForWeb(message, keys, callback: callback);
  }

  /// 发送某个会话中的消息阅读回执
  /// - [targetId] 会话 ID
  /// - [channelId] 频道 ID，仅支持超级群使用，其他会话类型传 null 即可。
  /// - [timestamp] 该会话中已读的最后一条消息的发送时间戳
  /// - [callback] 事件回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onPrivateReadReceiptMessageSent]
  Future<int> sendPrivateReadReceiptMessageForWeb(
      String targetId, String? channelId, int timestamp, String messageUId,
      {IRCIMIWSendPrivateReadReceiptMessageCallback? callback}) async {
    throw UnimplementedError(
        'sendPrivateReadReceiptMessage() has not been implemented.');
  }

  /// 更新超级群消息扩展信息
  /// - [message] 消息的 messageUid，可在消息对象中获取，且只有发送成功的消息才会有值
  /// - [expansion] 更新的消息扩展信息键值对，类型是 HashMap；Key 支持大小写英文字母、数字、部分特殊符号 + = - _ 的组合方式，不支持汉字。Value 可以输入空格。
  /// - [callback] 事件回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupMessageExpansionUpdated]
  Future<int> updateUltraGroupMessageExpansionForWeb(
      RCIMIWMessage message, Map expansion,
      {IRCIMIWUpdateUltraGroupMessageExpansionCallback? callback}) async {
    throw UnimplementedError(
        'updateUltraGroupMessageExpansionForWeb() has not been implemented.');
  }

  /// 删除超级群消息扩展信息中特定的键值对
  /// - [message] 消息的 messageUid，可在消息对象中获取，且只有发送成功的消息才会有值
  /// - [keys]  消息扩展信息中待删除的 key 的列表，类型是 ArrayList
  /// - [callback] 事件回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupMessageExpansionForKeysRemoved]
  Future<int> removeUltraGroupMessageExpansionForKeysForWeb(
      RCIMIWMessage message, List<String> keys,
      {IRCIMIWRemoveUltraGroupMessageExpansionForKeysCallback? callback}) {
    throw UnimplementedError(
        'removeUltraGroupMessageExpansionForKeysForWeb() has not been implemented.');
  }

  /// 修改超级群消息
  /// - [originalMessage] 发送成功的原始消息
  /// - [newMessage] 要修改的 message，要与原始消息类型一致
  /// - [callback] 事件回调
  /// - [返回值] 当次接口操作的状态码。0 代表调用成功 具体结果需要实现接口回调，非 0 代表当前接口调用操作失败，不会触发接口回调，详细错误参考错误码
  /// - [接口回调] [onUltraGroupMessageModified]
  Future<int> modifyUltraGroupMessageForWeb(
      RCIMIWMessage originalMessage, RCIMIWMessage newMessage,
      {IRCIMIWModifyUltraGroupMessageCallback? callback}) async {
    throw UnimplementedError(
        'modifyUltraGroupMessageForWeb() has not been implemented.');
  }

  // -------- web 专有的方法 --------
}
