//
//  OnBoardindModel.swift
//  testTask#3CionTable
//
//  Created by Виктор Басиев on 24.02.2023.
//

import Foundation

struct Onboarding {
    let index: Int
    let title: String
    let description: String
    let imageName: String
}

class OnboardingModel {
    func createModels() -> [Onboarding] {
        return [
            Onboarding(
                index: 0,
                title: "Приветствуем тебя",
                description: "в Coin Market!",
                imageName: "hiImage"
            ),
            Onboarding(
                index: 1,
                title: "",
                description: "Это приложение поможет тебе следить за курсом валют более комфортно и эффективно!",
                imageName: "mobile-dev"
            ),
            Onboarding(
                index: 2,
                title: "Читай полезные статьи",
                description: "Ты можешь получать актуальные новости в сфере криптовалюты в любое время со своего телефона.",
                imageName: "readingImage"
            ),
            Onboarding(
                index: 3,
                title: "Следи за ростом или падением",
                description: "Просматривай графики и получай уведомления о новых событиях.",
                imageName: "progressImage"
            )
        ]
    }
}


