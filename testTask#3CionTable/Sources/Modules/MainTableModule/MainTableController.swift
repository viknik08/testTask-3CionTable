//
//  MainTableController.swift
//  testTask#3CionTable
//
//  Created by Виктор Басиев on 23.02.2023.
//

import UIKit

class MainTableController: UIViewController {
    
    var presenter: MainTablePresenter?
    
//    MARK: - Outlet
    
    private let viewImage: UIImageView = {
        let image = UIImage(named: "crypto")?.blur(2)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.alpha = 0.5
        return imageView
    }()
    
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.delegate = self
        table.dataSource = self
        table.register(MainTableCell.self, forCellReuseIdentifier: MainTableCell.identifier)
        table.layer.cornerRadius = 20
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = .systemGray6
        table.layer.cornerRadius = 20
        return table
    }()
    
    
//    MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemYellow
        setupHierarchy()
        setupLayout()
        setupNavigationBar()
    }
    
//    MARK: - Setup
    
    private func setupNavigationBar() {
        title = "Coins"
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black, .font: UIFont.boldSystemFont(ofSize: 20)]
        
        let rightButtonMenu = UIMenu(title: "",  children: [
            UIAction(title: "Profile", image: UIImage(systemName: "newspaper"), handler: { _ in
                self.presenter?.showProfile()
            })
        ])
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "", image: UIImage(systemName: "person"), primaryAction: nil, menu: rightButtonMenu)
        
        let leftButtonMenu = UIMenu(title: "",  children: [
            UIAction(title: "Log Out", image: UIImage(systemName: "arrow.down.circle"), handler: { _ in
                self.presenter?.logOut()
            }),
            UIAction(title: "Refresh", image: UIImage(systemName: "arrow.up.circle"), handler: { _ in
                self.presenter?.refreshTableView()
            })
        ])
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", image: UIImage(systemName: "rectangle.and.hand.point.up.left.filled"), primaryAction: nil, menu: leftButtonMenu)
    }
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.top.left.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.right.equalTo(view).inset(10)
            make.bottom.equalTo(view).inset(20)

        }
    }
    
}

// MARK: - Extension Protocol

extension MainTableController: MainTableViewProtocol {
    func failure(error: Error) {
        print(error)
    }
    
    
    func reloadTableView() {
        tableView.reloadData()
    }
}

// MARK: - DataSource

extension MainTableController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.coins?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableCell.identifier, for: indexPath) as? MainTableCell else { return UITableViewCell() }
        let coin = presenter?.coins?[indexPath.row]
        cell.coin = coin
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

// MARK: - Delegate

extension MainTableController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let coin = presenter?.coins?[indexPath.row]
        presenter?.showDetail(coin: coin)
    }
}
