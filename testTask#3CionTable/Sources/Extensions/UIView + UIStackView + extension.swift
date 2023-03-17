//
//  UIView + UIStackView + extension.swift
//  testTask#3CionTable
//
//  Created by Виктор Басиев on 22.02.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ subViews: [UIView]) {
        subViews.forEach { addSubview($0) }
    }
}

extension UIStackView {
    func addArrangedSubviews(_ subView: [UIView]) {
        subView.forEach { addArrangedSubview($0) }
    }
}
