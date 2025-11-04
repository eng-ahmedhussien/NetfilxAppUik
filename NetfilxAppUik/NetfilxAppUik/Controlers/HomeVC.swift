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

    private enum sectionTitles: String, CaseIterable{
        case trendingMovies = "Trending Movies"
        case popular = "Popular"
        case trendingTv = "Trending Tv"
        case upcomingMovies = "Upcoming Movies"
        case topRated = "Top Rated"
        
        static func caseAtIndex(_ index: Int) -> sectionTitles? {
               switch index {
               case 0: return .trendingMovies
               case 1: return .popular
               case 2: return .trendingTv
               case 3: return .upcomingMovies
               case 4: return .topRated
               default: return nil
               }
           }
    }
    // MARK: - Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(homeFeedTable)
        homeFeedTable.tableHeaderView = HeroHeaderUIView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: view.bounds.width,
                height: 400
            )
        )
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        configureNavbar()
    }
    ///It gets called automatically by the system whenever the layout of the view controller's view needs to be adjusted
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
    
    // MARK: - functions
    private func  configureNavbar(){
        navigationController?.navigationBar.tintColor = .white
        var image  = UIImage(named: "netfilxLogo")
        image = image?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "pencil.tip"), style: .done, target: self, action: nil)
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
    }
    
}

extension HomeVC: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.allCases.count
    }
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
        return 200 //cell height
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles.caseAtIndex(section)?.rawValue //sections titles
    }
    

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(
            x: header.bounds.origin.x + 20,
            y:  header.bounds.origin.y,
            width: 100,
            height:  header.bounds.height
        )
        header.textLabel?.textColor = UIColor.black // Set the text color of the section titles
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
    
}

#Preview{
    HomeVC()
}

