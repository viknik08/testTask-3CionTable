//
//  Router.swift
//  testTask#3CionTable
//
//  Created by Виктор Басиев on 22.02.2023.
//

import UIKit

protocol RouterMainProtocol {
    var navigationController: UINavigationController? { get set }
    var moduleBuilder: ModuleBuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMainProtocol {
    func initialController()
    func showAuthViewController()
    func showRegistrationController()
    func showTableViewController()
    func showDetailController(coin: Coin?)
    func showOnboardingController()
    func showUserProfileController()

    func dismiss()
    func popToRoot()
}

class Router: RouterProtocol {
    
    var navigationController: UINavigationController?
    var moduleBuilder: ModuleBuilderProtocol?
    
    init(navigationController: UINavigationController, moduleBuilder: ModuleBuilderProtocol) {
        self.navigationController = navigationController
        self.moduleBuilder = moduleBuilder
    }

    func initialController() {
        if let navigationController = navigationController {
            guard let launchScreenModule = moduleBuilder?.creatLaunchScreenModule(router: self)  else { return }
            navigationController.viewControllers = [launchScreenModule]
        }
    }
    
    func showAuthViewController() {
        if let navigationController = navigationController {
            guard let authModule = moduleBuilder?.creatAuthModule(router: self)  else { return }
            navigationController.viewControllers = [authModule]
            SceneDelegate.shared.changeRootViewController(viewController: navigationController, animationOptions: .transitionCrossDissolve)
        }
    }
    
    func showRegistrationController() {
        if let navigationController = navigationController {
            guard let registratiionModule = moduleBuilder?.creatRegistrationModule(router: self) else { return }
            navigationController.present(registratiionModule, animated: true, completion: nil)
        }
    }

    func showTableViewController() {
        if let navigationController = navigationController {
            guard let tableModule = moduleBuilder?.creatTableViewModule(router: self)  else { return }
            navigationController.viewControllers = [tableModule]
            SceneDelegate.shared.changeRootViewController(viewController: navigationController, animationOptions: .transitionFlipFromRight)
        }
    }
    
    func showDetailController(coin: Coin?) {
        if let navigationController = navigationController {
            guard let detailModule = moduleBuilder?.creatDetailModule(coin: coin, router: self)  else { return }
            navigationController.pushViewController(detailModule, animated: true)
        }
    }
    
    func showOnboardingController() {
        if let navigationController = navigationController {
            guard let onboardingModule = moduleBuilder?.creatOnboardingModule(router: self)  else { return }
            navigationController.viewControllers = [onboardingModule]
            SceneDelegate.shared.changeRootViewController(viewController: navigationController, animationOptions: .transitionCrossDissolve)
        }
    }
    
    func showUserProfileController() {
        if let navigationController = navigationController {
            guard let userProfileModule = moduleBuilder?.creatUserProfileModule(router: self)  else { return }
            navigationController.pushViewController(userProfileModule, animated: true)
        }
    }


    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
        
    }
    
    func dismiss() {
        if let navigationController = navigationController {
            navigationController.dismiss(animated: true, completion: nil)
        }
    }
}
