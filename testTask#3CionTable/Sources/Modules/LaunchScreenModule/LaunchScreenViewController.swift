//
//  ViewController.swift
//  testTask#3CionTable
//
//  Created by Виктор Басиев on 21.02.2023.
//

import UIKit
import SnapKit

class LaunchScreenViewController: UIViewController {
    
    var presenter: LaunchScreenPresenterProtocol?
    
//    MARK: - Outlets
    
    private let launchImage: UIImageView = {
        let image = UIImage(named: "crypto")?.blur(2)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.alpha = 0.7
        return imageView
    }()
    
    private let launchLable: UILabel = {
        let label = UILabel()
        label.text = "Coin Market"
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = .white
        label.layer.shadowColor = UIColor.white.cgColor
        label.layer.shadowOpacity = 0.5
        label.layer.shadowOffset = .zero
        label.layer.shadowRadius = 10
        label.layer.shouldRasterize = true
        label.layer.rasterizationScale = UIScreen.main.scale
        return label
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.hidesWhenStopped = true
        indicator.color = .white
        return indicator
    }()

//    MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHierarchy()
        setupLayout()
        presenter?.isAuth()

    }
    
//    MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(launchImage)
        view.addSubview(launchLable)
        view.addSubview(activityIndicator)
    }
    
    private func setupLayout() {
        launchImage.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(view)
        }
        launchLable.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(view)
        }
        activityIndicator.snp.makeConstraints { make in
            make.top.equalTo(launchLable.snp.bottom).offset(20)
            make.centerX.equalTo(view)
        }
    }

}

//    MARK: - Extension

extension LaunchScreenViewController: LaunchScreenViewProtocol {
    
    func updataViewData(_ data: ViewData) {
        switch data {
        
        case .loading:
            self.activityIndicator.startAnimating()
        case .success:
            self.activityIndicator.stopAnimating()
        default:
            break
            
        }
    }
    
    
    
}

