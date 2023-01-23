import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'plugin_stream_platform_interface.dart';

/// An implementation of [PluginStreamPlatform] that uses method channels.
class MethodChannelPluginStream extends PluginStreamPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('plugin_stream');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Stream<int> getData(){
    const event = EventChannel('plugin_stream_get_data');
    return event.receiveBroadcastStream().cast<int>().map((map) => map);
  }
}
