#import <Cordova/CDV.h>
#import "CDVSceneDelegate.h"

@interface CDVSceneDelegate (Commands) <CDVCommandDelegate>

- (void)isSceneDelegateActive:(CDVInvokedUrlCommand*)command;
- (void)handleDeepLink:(CDVInvokedUrlCommand*)command;
- (void)getSceneState:(CDVInvokedUrlCommand*)command;

@end