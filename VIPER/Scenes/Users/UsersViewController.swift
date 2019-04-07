//
//  UsersViewController.swift
//  VIPER
//
//  Created by Vortex on 4/7/19.
//  Copyright © 2019 Ibtdi. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UsersViewProtocol {
    
    var presenter: UsersPresenterProtocol!
    
    @IBOutlet weak var usersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter.viewDidLoad()
    }
    
    private func setupTableView() {
        usersTableView.dataSource = self
        usersTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
        presenter.configure(cell: cell, indexPath: indexPath)
        return cell
    }
    
    func showLoadingIndicator() {
        print("Should show loading indicator")
    }
    
    func hideLoadingIndicator() {
        print("Should hide loading indicator")
    }
    
    func reloadData() {
        usersTableView.reloadData()
    }
    
}
