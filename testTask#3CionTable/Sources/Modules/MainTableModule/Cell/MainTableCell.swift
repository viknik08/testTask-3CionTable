//
//  MainTableCell.swift
//  testTask#3CionTable
//
//  Created by Виктор Басиев on 23.02.2023.
//

import UIKit

class MainTableCell: UITableViewCell {
    
    static let identifier = "MainTableCell"
    
    var coin: Coin? {
        didSet {
            guard let coin = coin else { return }
            titleLable.text = coin.name
            descriptionLabel.text = coin.symbol
            imageLogo.image = UIImage(named: coin.symbol)
            priceLable.text = String(format: "%.3f", coin.marketData.priceUsd ?? 0) + "$"
        }
    }
    
//    MARK: - Outlet
    
    private let imageLogo: UIImageView = {
        let image = UIImage(named: "crypto")
        let logo = UIImageView(image: image)
        logo.layer.cornerRadius = 25
        logo.contentMode = .scaleAspectFill
        logo.clipsToBounds = true
        return logo
    }()
    
    private let titleLable: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.font = .boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.font = .systemFont(ofSize: 14)
        
        return label
    }()
    
    private let priceLable: UILabel = {
        let label = UILabel()
        label.text = "00000"
        label.font = .boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    private let labelStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.alignment = .leading
        stack.spacing = 1
        return stack
    }()
    
//    MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupHierarchy()
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - Setup
    
    private func setupHierarchy() {
        addSubviews([imageLogo, labelStack, priceLable])
        labelStack.addArrangedSubviews([titleLable , descriptionLabel])
        
    }
    
    private func setupLayout() {
        imageLogo.snp.makeConstraints { make in
            make.left.equalTo(self).offset(20)
            make.top.equalTo(self).offset(10)
            make.bottom.equalTo(self).inset(10)
            make.width.height.equalTo(50)
        }
        
        labelStack.snp.makeConstraints { make in
            make.left.equalTo(imageLogo.snp.right).offset(10)
            make.top.equalTo(self).offset(10)
            make.bottom.equalTo(self).inset(10)
            make.height.equalTo(50)
        }
        
        priceLable.snp.makeConstraints { make in
            make.right.equalTo(self).inset(20)
            make.top.equalTo(self).offset(10)
            make.bottom.equalTo(self).inset(10)
        }
    }
    
//    MARK: - Reuse
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLable.text = nil
        descriptionLabel.text = nil
        imageLogo.image = nil
        priceLable.text = nil
        self.accessoryType = .none
    }
    
    
}
