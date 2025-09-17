import UIKit
import Cordova

@objc(CDVSceneDelegate)
class CDVSceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var viewController: CDVViewController?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        
        window = UIWindow(windowScene: windowScene)
        viewController = CDVViewController()
        viewController?.wwwFolderName = "www"
        viewController?.startPage = "index.html"
        
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        
        // Handle URL context options
        if !connectionOptions.urlContexts.isEmpty {
            handleURLContexts(connectionOptions.urlContexts)
        }
    }
    
    private func handleURLContexts(_ urlContexts: Set<UIOpenURLContext>) {
        for context in urlContexts {
            let url = context.url
            print("Handle URL: \(url)")
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Scene being released
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        viewController?.viewDidAppear(false)
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        viewController?.viewWillDisappear(false)
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        viewController?.viewWillAppear(false)
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        viewController?.viewDidDisappear(false)
    }
}