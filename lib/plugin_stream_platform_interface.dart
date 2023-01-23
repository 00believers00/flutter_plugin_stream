import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'plugin_stream_method_channel.dart';

abstract class PluginStreamPlatform extends PlatformInterface {
  /// Constructs a PluginStreamPlatform.
  PluginStreamPlatform() : super(token: _token);

  static final Object _token = Object();

  static PluginStreamPlatform _instance = MethodChannelPluginStream();

  /// The default instance of [PluginStreamPlatform] to use.
  ///
  /// Defaults to [MethodChannelPluginStream].
  static PluginStreamPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PluginStreamPlatform] when
  /// they register themselves.
  static set instance(PluginStreamPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Stream<int> getData(){
    throw UnimplementedError('getData() has not been implemented.');
  }
}
