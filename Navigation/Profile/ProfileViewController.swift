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
    
//    let profileHeaderView: ProfileHeaderView = {
//        let headerView = ProfileHeaderView()
//        return headerView
//    }()
    
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
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
        navigationController?.navigationBar.isHidden = false
        view.backgroundColor = .white
        title = tabBarItem.title
      
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: CellReuseID.default.rawValue)
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: CellReuseID.sectionHeader.rawValue)
       
        //  view.addSubview(profileHeaderView)
    
        
      // profileHeaderView.statusButton.addTarget(self, action: #selector(statusButtonPressed), for: .touchUpInside)
     //  profileHeaderView.statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        

    }
    
    override func viewWillLayoutSubviews() {
        configureLayout()
    }
    
    func configureLayout() {
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        
//        profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
//        profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        profileHeaderView.heightAnchor.constraint(equalToConstant: 220).isActive = true
    }
    
    func configureTabBarItem() {
        tabBarItem.title = "Profile"
        tabBarItem.image = UIImage(systemName: "person")
        tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        tabBarItem.tag = 20
    }
    
    @objc func statusButtonPressed(){
        print("press")
//        if let statusText = profileHeaderView.statusText {
//            profileHeaderView.statusTextLabel.text = statusText
//        }
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        print("Text editing")
//        profileHeaderView.statusText = textField.text
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseID = CellReuseID.default.rawValue
         let cell = tableView.dequeueReusableCell(withIdentifier:
                                                    reuseID, for: indexPath) as! PostTableViewCell
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                                                                CellReuseID.sectionHeader.rawValue) as! ProfileHeaderView
        
        view.statusButton.addTarget(self, action: #selector(statusButtonPressed), for: .touchUpInside)
        view.statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        
        if section == 0 {
            return view
        }
        return nil
    }
    
}


