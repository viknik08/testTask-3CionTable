//
//  OnBoardingPresenter.swift
//  testTask#3CionTable
//
//  Created by Виктор Басиев on 24.02.2023.
//

import Foundation

protocol OnBoardingViewProtocol: AnyObject {
    func configureView()
}

protocol OnBoardingPresenterProtocol: AnyObject {
    init(view: OnBoardingViewProtocol, router: RouterProtocol, onboardingModel: OnboardingModel)
    var models: [Onboarding] { get set }
    func getOnboardModel()
    func endOndoardinShow()
}

class OnBoardingPresenter: OnBoardingPresenterProtocol {

    weak var view: OnBoardingViewProtocol?
    var router: RouterProtocol?
    var models = [Onboarding]()
    var onboardingModel: OnboardingModel?
    
    required init(view: OnBoardingViewProtocol, router: RouterProtocol, onboardingModel: OnboardingModel) {
        self.view = view
        self.router = router
        self.onboardingModel = onboardingModel
    }
    
    func endOndoardinShow() {
        router?.showAuthViewController()
    }
    func getOnboardModel() {
        guard let models = onboardingModel?.createModels() else { return }
        self.models = models
        view?.configureView()
    }

}


