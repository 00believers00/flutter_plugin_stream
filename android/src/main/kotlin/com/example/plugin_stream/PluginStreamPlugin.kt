package com.example.plugin_stream

import android.annotation.SuppressLint
import android.os.Handler
import android.os.Looper
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.EventChannel.StreamHandler
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.util.*


@SuppressLint("KotlinNullnessAnnotation")
/** PluginStreamPlugin */
class PluginStreamPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private var counter:Int = 0;
  private val uiThreadHandler: Handler = Handler(Looper.getMainLooper())

  override fun onAttachedToEngine( @NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "plugin_stream")
    channel.setMethodCallHandler(this)

    val eventChannel = EventChannel(flutterPluginBinding.binaryMessenger, "plugin_stream_get_data")
    eventChannel.setStreamHandler(getDataHandler)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    }else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }


  private val getDataHandler = object: StreamHandler {
    override fun onListen(p0: Any?, p1: EventChannel.EventSink) {
      Timer().schedule(object : TimerTask() {
        override fun run() {
          uiThreadHandler.post{
            p1.success(counter)
            counter++
          }

        }
      }, 0, 1000)

    }
    override fun onCancel(p0: Any) {

    }
  }

}
