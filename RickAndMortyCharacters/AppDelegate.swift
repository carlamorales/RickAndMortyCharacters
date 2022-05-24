import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        let apiCall = ApiCall()
        let apiCallErrorToDomainErrorMapper = ApiCallErrorToDomainErrorMapper()
        let repository = RickAndMortyCharactersRepository(
            apiRest: apiCall,
            apiCallErrorToDomainErrorMapper: apiCallErrorToDomainErrorMapper
        )
        let recapViewController = RecapViewController()
        recapViewController.repository = repository
        
        let navigationController = UINavigationController(rootViewController: recapViewController)
        window?.rootViewController = navigationController
        
        return true
    }
}
