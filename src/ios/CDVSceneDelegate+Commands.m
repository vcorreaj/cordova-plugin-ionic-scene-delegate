#import "CDVSceneDelegate+Commands.h"
#import <Cordova/CDV.h>

@implementation CDVSceneDelegate (Commands)

- (void)isSceneDelegateActive:(CDVInvokedUrlCommand*)command {
    CDVPluginResult* pluginResult = nil;
    
    // Verificar si el SceneDelegate está activo
    BOOL isActive = (self.window != nil && self.viewController != nil);
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:isActive];
    
    // Usar el commandDelegate del viewController de Cordova
    [self.viewController.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)handleDeepLink:(CDVInvokedUrlCommand*)command {
    NSString* urlString = [command.arguments objectAtIndex:0];
    
    if (urlString && [urlString isKindOfClass:[NSString class]]) {
        NSURL* url = [NSURL URLWithString:urlString];
        if (url) {
            NSLog(@"Deep link handled: %@", url);
            CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
            [self.viewController.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            return;
        }
    }
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Invalid URL"];
    [self.viewController.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getSceneState:(CDVInvokedUrlCommand*)command {
    NSMutableDictionary* state = [NSMutableDictionary dictionary];
    
    [state setObject:@(self.window != nil) forKey:@"hasWindow"];
    [state setObject:@(self.viewController != nil) forKey:@"hasViewController"];
    [state setObject:@(self.viewController.isViewLoaded && self.viewController.view.window != nil) forKey:@"isViewVisible"];
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:state];
    [self.viewController.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end