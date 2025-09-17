#import "CDVSceneDelegate+Commands.h"

@implementation CDVSceneDelegate (Commands)

- (void)isSceneDelegateActive:(CDVInvokedUrlCommand*)command {
    CDVPluginResult* pluginResult = nil;
    
    if (self.window != nil && self.viewController != nil) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:YES];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:NO];
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)handleDeepLink:(CDVInvokedUrlCommand*)command {
    NSString* urlString = [command.arguments objectAtIndex:0];
    
    if (urlString && [urlString isKindOfClass:[NSString class]]) {
        NSURL* url = [NSURL URLWithString:urlString];
        if (url) {
            // Aquí puedes manejar el deep link
            NSLog(@"Deep link handled: %@", url);
            
            CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            return;
        }
    }
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Invalid URL"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getSceneState:(CDVInvokedUrlCommand*)command {
    NSMutableDictionary* state = [NSMutableDictionary dictionary];
    
    if (self.window) {
        [state setObject:@(YES) forKey:@"hasWindow"];
    }
    
    if (self.viewController) {
        [state setObject:@(YES) forKey:@"hasViewController"];
    }
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:state];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end