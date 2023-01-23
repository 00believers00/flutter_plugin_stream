#import "PluginStreamPlugin.h"
#if __has_include(<plugin_stream/plugin_stream-Swift.h>)
#import <plugin_stream/plugin_stream-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "plugin_stream-Swift.h"
#endif

@implementation PluginStreamPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPluginStreamPlugin registerWithRegistrar:registrar];
}
@end
