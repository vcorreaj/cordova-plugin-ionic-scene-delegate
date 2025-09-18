#import "CDVSceneDelegate.h"
#import <Cordova/CDV.h>
#import "CDVSceneDelegate+Commands.h"

@implementation CDVSceneDelegate

- (CDVViewController *)createCordovaViewController {
    CDVViewController *viewController = [[CDVViewController alloc] init];
    viewController.wwwFolderName = @"www";
    viewController.startPage = @"index.html";
    return viewController;
}

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    if (![scene isKindOfClass:[UIWindowScene class]]) return;
    
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
    
    // ✅ CREAR CDVViewController PROGRAMÁTICAMENTE - SIN STORYBOARD
    self.viewController = [[CDVViewController alloc] init];
    self.viewController.wwwFolderName = @"www";
    self.viewController.startPage = @"index.html";
    
    // Configure window
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    // Handle URL options if any
    if (connectionOptions.URLContexts.count > 0) {
        [self handleURLContexts:connectionOptions.URLContexts];
    }
}

- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
}

- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    [self.viewController viewDidAppear:NO];
}

- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    [self.viewController viewWillDisappear:NO];
}

- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    [self.viewController viewWillAppear:NO];
}

- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    [self.viewController viewDidDisappear:NO];
}

- (void)handleURLContexts:(NSSet<UIOpenURLContext *> *)URLContexts {
    for (UIOpenURLContext *context in URLContexts) {
        NSURL *url = context.URL;
        // Handle the URL as needed for your app
        NSLog(@"Handle URL: %@", url);
    }
}

@end