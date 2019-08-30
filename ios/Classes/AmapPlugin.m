#import "AmapPlugin.h"
#import <amap/amap-Swift.h>

@implementation AmapPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAmapPlugin registerWithRegistrar:registrar];
}
@end
