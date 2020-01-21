//
//  AppDelegate.swift
//  StarWars
//
//  Created by Pranjali Wagh on 28/03/19.
//  Copyright © 2019 Pranjali Wagh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var navigationController: UINavigationController?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        navigationController = UINavigationController(rootViewController: StarWarCharactersAssembler(entity: StarWarCharactersEntity(), network: UrlSessionComponent()).assemble(with: self).viewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }

}
extension AppDelegate: StarWarCharactersWireframe {
    
    func select(person : Person) {
        let viewController = StarWarDetailAssembler(person: person).assemble(with: self).viewController
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension AppDelegate: StarWarDetailWireframe {
    
    func present(profile: Person) {
       
        let viewController = MagicDetailsAssembler(profile: profile).assemble(with: self).viewController
        navigationController?.pushViewController(viewController, animated: true)
    }
}
extension AppDelegate: MagicDetailsWireframe {
}


