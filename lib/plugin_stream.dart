
import 'plugin_stream_platform_interface.dart';

class PluginStream {
  Future<String?> getPlatformVersion() {
    return PluginStreamPlatform.instance.getPlatformVersion();
  }

  Stream<int> getData() {
    return PluginStreamPlatform.instance.getData();
  }
}
