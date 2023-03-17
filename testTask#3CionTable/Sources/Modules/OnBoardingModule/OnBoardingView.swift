//
//  OnBoardingView.swift
//  testTask#3CionTable
//
//  Created by Виктор Басиев on 24.02.2023.
//

import UIKit
import SnapKit

//    func configureView() {
//        guard let models = model?.createModels() else { return }
//        models.forEach { [unowned self] model in
//            onboardingView?.configureView(with: [model])
//        }
//        onboardingView?.configureView(with: models)
//    }

class OnBoardingViewController: UIViewController {
    
    var presenter: OnBoardingPresenterProtocol?
    
    private var selectedIndex = 0 {
        didSet {
            guard let presenter = presenter else { return }
            let isListPage = presenter.models.count - 1 > selectedIndex
            buttonNext.setTitle(isListPage ? "Далее" : "Начать!", for: .normal)
            buttonNext.backgroundColor = .systemGreen
        }
    }
    
//    MARK: - Outlets
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 16
        view.distribution = .equalSpacing
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = .zero
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .white
        view.isPagingEnabled = true
        
        view.dataSource = self
        view.delegate = self
        
        view.showsHorizontalScrollIndicator = false
        
        view.register(OnboardingContentViewCell.self, forCellWithReuseIdentifier: OnboardingContentViewCell.identifier)
        return view
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .systemGray2
        return pageControl
    }()
    
    private let buttonNext: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.tintColor = .white
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(buttonNextTap), for: .touchUpInside)
        return button
    }()
    
//    MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupHierarchy()
        setupLayout()
        
        presenter?.getOnboardModel()
        
    }
    
//    MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubviews([collectionView, stackView])
        stackView.addArrangedSubviews([pageControl, buttonNext])
    }
    
    private func setupLayout() {
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).inset(10)
            make.height.equalTo(view.bounds.height / 1.5)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(20)
            make.centerX.equalTo(view)
            make.bottom.equalTo(view).inset(20)
        }
        
        buttonNext.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.width.equalTo(240)
        }
        pageControl.snp.makeConstraints { make in
            make.left.right.equalTo(stackView)
        }
        
    }
    
//    MARK: - Action
    
    @objc func buttonNextTap() {
        guard let presenter = presenter else { return }
        
        if presenter.models.count - 1 > selectedIndex {
            collectionView.scrollToItem(at: IndexPath(item: selectedIndex + 1, section: 0),
                                       at: .centeredHorizontally, animated: true)

            selectedIndex += 1
            pageControl.currentPage += 1
        } else {
            presenter.endOndoardinShow()
        }
    }
    
}

//    MARK: - Extension

extension OnBoardingViewController: OnBoardingViewProtocol {
    
    func configureView() {
        pageControl.numberOfPages = presenter?.models.count ?? 0
        pageControl.currentPage = 0
        selectedIndex = 0
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource

extension OnBoardingViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.models.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingContentViewCell.identifier, for: indexPath) as? OnboardingContentViewCell else { return UICollectionViewCell() }
        cell.onboardingModel = presenter?.models[indexPath.row]
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension OnBoardingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let newIndexPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        pageControl.currentPage = newIndexPage
        selectedIndex = newIndexPage
    }
}

