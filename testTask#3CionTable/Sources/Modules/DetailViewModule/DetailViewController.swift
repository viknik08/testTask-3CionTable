//
//  DetailViewController.swift
//  testTask#3CionTable
//
//  Created by Виктор Басиев on 23.02.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    var presenter: DetailPresenterProtocol?
    
//    MARK: - Outlets
    
    private let titleLable: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.font = .boldSystemFont(ofSize: 28)
        return label
    }()
    
    private let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 0
        image.alpha = 0.2
        return image
    }()
    
    private let viewUnderMainStack: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 10
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = UIScreen.main.scale
        return view
    }()
    
    private let maineStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fillEqually
        stack.alignment = .center
        return stack
    }()
    
//    MARK: - USDstack
    
    private let usdLabel: UILabel = {
        let label = UILabel()
        label.text = "Price in USD"
        label.font = .systemFont(ofSize: 18, weight: .black)
        return label
    }()
    
    private let usdPriceLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    private let usdStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.layer.cornerRadius = 20
        stack.backgroundColor = .white
        
        stack.layer.shadowColor = UIColor.black.cgColor
        stack.layer.shadowOpacity = 0.3
        stack.layer.shadowOffset = .zero
        stack.layer.shadowRadius = 10
        stack.layer.shouldRasterize = true
        stack.layer.rasterizationScale = UIScreen.main.scale
        return stack
    }()
    
//    MARK: - ETHstack
    
    private let ethLabel: UILabel = {
        let label = UILabel()
        label.text = "Price in ETH"
        label.font = .systemFont(ofSize: 18, weight: .black)
        return label
    }()
    
    private let ethPriceLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    private let ethStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.layer.cornerRadius = 20
        stack.backgroundColor = .white
        
        stack.layer.shadowColor = UIColor.black.cgColor
        stack.layer.shadowOpacity = 0.3
        stack.layer.shadowOffset = .zero
        stack.layer.shadowRadius = 10
        stack.layer.shouldRasterize = true
        stack.layer.rasterizationScale = UIScreen.main.scale
        return stack
    }()
    
//    MARK: - BTCstack
    
    private let btcLabel: UILabel = {
        let label = UILabel()
        label.text = "Price in ETH"
        label.font = .systemFont(ofSize: 18, weight: .black)
        return label
    }()
    
    private let btcPriceLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    private let btcStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.layer.cornerRadius = 20
        stack.backgroundColor = .white
        
        stack.layer.shadowColor = UIColor.black.cgColor
        stack.layer.shadowOpacity = 0.3
        stack.layer.shadowOffset = .zero
        stack.layer.shadowRadius = 10
        stack.layer.shouldRasterize = true
        stack.layer.rasterizationScale = UIScreen.main.scale
        return stack
    }()
    
    
//    MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemYellow
        
        setupHeirarchy()
        setupLayout()
        presenter?.getCoin()
    }
    
//    MARK: - Setup
    
    private func setupHeirarchy() {
        view.addSubviews([titleLable, backgroundImage, viewUnderMainStack])
        viewUnderMainStack.addSubview(maineStack)
        maineStack.addArrangedSubviews([usdStack, ethStack, btcStack])
        usdStack.addArrangedSubviews([usdLabel, usdPriceLabel])
        ethStack.addArrangedSubviews([ethLabel, ethPriceLabel])
        btcStack.addArrangedSubviews([btcLabel, btcPriceLabel])
    }
    
    private func setupLayout() {
        titleLable.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalTo(view)
        }
        
        backgroundImage.snp.makeConstraints { make in
            make.top.right.left.bottom.equalTo(view)
            make.center.equalTo(view)
            make.height.equalTo(view.snp.height)
        }
        
        viewUnderMainStack.snp.makeConstraints { make in
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).inset(20)
            make.centerX.centerY.equalTo(view)
            make.height.equalTo(view.bounds.height / 2)
        }
        
        maineStack.snp.makeConstraints { make in
            make.top.left.equalTo(viewUnderMainStack).offset(20)
            make.bottom.right.equalTo(viewUnderMainStack).inset(20)
            make.centerX.centerY.equalTo(viewUnderMainStack)
        }
        
        usdStack.snp.makeConstraints { make in
            make.left.equalTo(maineStack)
            make.right.equalTo(maineStack)
        }
        
        ethStack.snp.makeConstraints { make in
            make.left.equalTo(maineStack)
            make.right.equalTo(maineStack)
        }
        
        btcStack.snp.makeConstraints { make in
            make.left.equalTo(maineStack)
            make.right.equalTo(maineStack)
        }
    }
}

extension DetailViewController: DetailViewProtocol {
    
    func setCoin(coin: Coin?) {
        titleLable.text = coin?.name
        title = coin?.name
        backgroundImage.image = UIImage(named: coin?.symbol ?? "")
        usdPriceLabel.text = "Price of this coin -> " + String(format: "%.2f", coin?.marketData.priceUsd ?? 0) + "$"
        ethPriceLabel.text = "Price of this coin -> " + String(format: "%.2f", coin?.marketData.priceEth ?? 0) + "ETH"
        btcPriceLabel.text = "Price of this coin -> " + String(format: "%.2f", coin?.marketData.priceBtc ?? 0) + "BTC"
    }
}
