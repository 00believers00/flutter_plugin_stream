import Flutter
import UIKit

public class SwiftPluginStreamPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "plugin_stream", binaryMessenger: registrar.messenger())
    let instance = SwiftPluginStreamPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
      
     let eventChannel = FlutterEventChannel(name: "plugin_stream_get_data", binaryMessenger: registrar.messenger())
      eventChannel.setStreamHandler(CounterStream())
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
      default:
        result("iOS " + UIDevice.current.systemVersion)
        break
   }
  }
}
