import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_stream/plugin_stream.dart';
import 'package:plugin_stream/plugin_stream_platform_interface.dart';
import 'package:plugin_stream/plugin_stream_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPluginStreamPlatform
    with MockPlatformInterfaceMixin
    implements PluginStreamPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Stream<int> getData() {
    final controller = StreamController<int>.broadcast();
    return controller.stream;
  }
}

void main() {
  final PluginStreamPlatform initialPlatform = PluginStreamPlatform.instance;

  test('$MethodChannelPluginStream is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPluginStream>());
  });

  test('getPlatformVersion', () async {
    PluginStream pluginStreamPlugin = PluginStream();
    MockPluginStreamPlatform fakePlatform = MockPluginStreamPlatform();
    PluginStreamPlatform.instance = fakePlatform;

    expect(await pluginStreamPlugin.getPlatformVersion(), '42');
  });
}
