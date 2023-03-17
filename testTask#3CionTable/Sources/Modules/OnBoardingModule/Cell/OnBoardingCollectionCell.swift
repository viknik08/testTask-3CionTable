//
//  OnBoardingCollectionCell.swift
//  testTask#3CionTable
//
//  Created by Виктор Басиев on 24.02.2023.
//

import UIKit
import SnapKit

class OnboardingContentViewCell: UICollectionViewCell {
    
    static let identifier = "OnboardingContentViewCell"

    var onboardingModel: Onboarding? {
        didSet {
            guard let onboarding = onboardingModel else { return }
            titleLabel.text = onboarding.title
            imageView.image = UIImage(named: onboarding.imageName)
            descriptionLabel.text = onboarding.description
        }
    }
    
    // MARK: - Outlets
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 16
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17)
        label.textColor = .secondaryLabel
        return label
    }()
    
    // MARK: - Initial
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        addSubview(stackView)
        stackView.addArrangedSubviews([imageView, titleLabel, descriptionLabel])
    }
    
    private func setupLayout() {
        stackView.snp.makeConstraints { make in
            make.centerY.centerX.equalTo(self)
            make.left.equalTo(self).offset(40)
            make.right.equalTo(self).offset(-40)
        }
        
        imageView.snp.makeConstraints { make in
            make.height.equalTo(self).multipliedBy(0.35)
        }
    }
}



