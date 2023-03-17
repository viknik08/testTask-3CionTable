//
//  ModuleBuilder.swift
//  testTask#3CionTable
//
//  Created by Виктор Басиев on 21.02.2023.
//

import UIKit

protocol ModuleBuilderProtocol {
    func creatLaunchScreenModule(router: RouterProtocol) -> UIViewController
    func creatAuthModule(router: RouterProtocol) -> UIViewController
    func creatRegistrationModule(router: RouterProtocol) -> UIViewController
    func creatTableViewModule(router: RouterProtocol) -> UIViewController
    func creatDetailModule(coin: Coin?, router: RouterProtocol) -> UIViewController
    func creatOnboardingModule(router: RouterProtocol) -> UIViewController
    func creatUserProfileModule(router: RouterProtocol) -> UIViewController

}

class ModuleBuilder: ModuleBuilderProtocol {
    
    func creatLaunchScreenModule(router: RouterProtocol) -> UIViewController {
        let view = LaunchScreenViewController()
        let networkManager = NetworkManager()
        let userManager = UserManager()
        let presenter = LaunchScreenPresenter(view: view, networkManager: networkManager, router: router, userManager: userManager)
        view.presenter = presenter
        
        return view
    }
    
    func creatAuthModule(router: RouterProtocol) -> UIViewController {
        let view = AuthViewController()
        let networkManager = NetworkManager()
        let userManager = UserManager()
        let presenter = AuthPresenter(view: view, networkManager: networkManager, router: router, userManager: userManager)
        view.presenter = presenter
        
        return view
    }
    
    func creatRegistrationModule(router: RouterProtocol) -> UIViewController {
        let view = RegistrationViewController()
        let userManager = UserManager()
        let presenter = RegistrationPresenter(view: view, router: router, userManager: userManager)
        view.presenter = presenter
        
        return view
    }
    
    func creatTableViewModule(router: RouterProtocol) -> UIViewController {
        let view = MainTableController()
        let networkManager = NetworkManager()
        let presenter = MainTablePresenter(view: view, networkManager: networkManager, router: router)
        view.presenter = presenter
        
        return view
    }
    
    func creatDetailModule(coin: Coin?, router: RouterProtocol) -> UIViewController {
        let view = DetailViewController()
        let networkManager = NetworkManager()
        let presenter = DetailPresenter(view: view, networkManager: networkManager, router: router, coin: coin)
        view.presenter = presenter
        
        return view
    }
    
    func creatOnboardingModule(router: RouterProtocol) -> UIViewController {
        let view = OnBoardingViewController()
        let onboardingModel = OnboardingModel()
        let presenter = OnBoardingPresenter(view: view, router: router, onboardingModel: onboardingModel)
        view.presenter = presenter
        
        return view
    }
    
    func creatUserProfileModule(router: RouterProtocol) -> UIViewController {
        let view = UserProfileViewController()
        let userManager = UserManager()
        let presenter = UserProfilePresenter(view: view, userManager: userManager, router: router)
        view.presenter = presenter
        
        return view

    }

}
