#import <UIKit/UIKit.h>
#import <Cordova/CDVViewController.h>

NS_ASSUME_NONNULL_BEGIN

@interface CDVSceneDelegate : UIResponder <UIWindowSceneDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) CDVViewController *viewController;

@end

NS_ASSUME_NONNULL_END