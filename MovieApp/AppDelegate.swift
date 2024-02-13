//
//  AppDelegate.swift
//  MovieApp
//
//  Created by k1d_dev on 11/08/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		self.window = UIWindow(frame: UIScreen.main.bounds)
		
		let viewController = HomeViewController()
		let interactor: HomeInteractorInterface = HomeInteractor()
		let wireframe: HomeWireframeInterface = HomeWireframe()
		viewController.presenter = HomePresenter(view: viewController, interactor: interactor, wireframe: wireframe)
		let navigationController = UINavigationController(rootViewController: viewController)
		window?.rootViewController = navigationController
		window?.makeKeyAndVisible()
		
        return true
    }
}

