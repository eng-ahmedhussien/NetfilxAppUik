//
//  HomeVC.swift
//  NetfilxAppUik
//
//  Created by ahmed hussien on 09/03/2024.
//

import UIKit

class HomeVC: UIViewController {
    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
       // view.backgroundColor = .gray
        view.addSubview(homeFeedTable)
        homeFeedTable.tableHeaderView =  HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 400))
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
    }
    ///It gets called automatically by the system whenever the layout of the view controller's view needs to be adjusted
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
}

extension HomeVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
           
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
}

#Preview{
    HomeVC()
}
