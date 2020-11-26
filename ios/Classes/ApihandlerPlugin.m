#import "ApihandlerPlugin.h"
#if __has_include(<apihandler/apihandler-Swift.h>)
#import <apihandler/apihandler-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "apihandler-Swift.h"
#endif

@implementation ApihandlerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftApihandlerPlugin registerWithRegistrar:registrar];
}
@end
