import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        let apiCall = ApiCall()
        let recapViewController = RecapViewController()
        recapViewController.apiRest = apiCall
        
        let navigationController = UINavigationController(rootViewController: recapViewController)
        window?.rootViewController = navigationController
        
        return true
    }
}
