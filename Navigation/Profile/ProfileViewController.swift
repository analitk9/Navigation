//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Denis Evdokimov on 10/17/21.
//

import UIKit

class ProfileViewController: UIViewController {
   
    fileprivate enum CellReuseID: String {
        case `default` = "TableViewCellReuseIDDefault"
        case sectionHeader = "TableViewHeaderSectionID"
    }
    
    let model: [Post] = Posts.createMockData()
        
    let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .singleLine
        table.separatorColor = .black
        return table
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        configureTabBarItem()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = tabBarItem.title
      
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: CellReuseID.default.rawValue)
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: CellReuseID.sectionHeader.rawValue)

    }
    
    override func viewWillLayoutSubviews() {
        configureLayout()
    }
    
    func configureLayout() {
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        
    }
    
    func configureTabBarItem() {
        tabBarItem.title = "Profile"
        tabBarItem.image = UIImage(systemName: "person")
        tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        tabBarItem.tag = 20
    }
}

extension ProfileViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 220
    }
}

extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let reuseID = CellReuseID.default.rawValue
        guard let cell = tableView.dequeueReusableCell(withIdentifier:
                                                        reuseID, for: indexPath) as? PostTableViewCell else { fatalError() }
        
        let post = model[indexPath.row]
        cell.configure(post)

        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let reuseId = CellReuseID.sectionHeader.rawValue
        guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                                                                    reuseId) as? ProfileHeaderView else { fatalError() }
        if section == 0 {
            return view
        }
        return nil
    }
    
}


