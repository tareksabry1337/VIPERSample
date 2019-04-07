//
//  UsersProtocol.swift
//  VIPER
//
//  Created by Vortex on 4/7/19.
//  Copyright © 2019 Ibtdi. All rights reserved.
//

import Foundation

protocol UsersViewProtocol: class {
    var presenter: UsersPresenterProtocol! { get set }
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func reloadData()
}

protocol UsersPresenterProtocol: class {
    var view: UsersViewProtocol? { get set }
    var numberOfRows: Int { get }
    func viewDidLoad()
    func configure(cell: UsersCellView, indexPath: IndexPath)
}

protocol UsersRouterProtocol {
    
}

protocol UsersInteractorInputProtocol {
    var presenter: UsersInteractorOutputProtocol? { get set }
    func getUsers()
}

protocol UsersInteractorOutputProtocol: class {
    func usersFetchedSuccessfully(users: [User])
    func usersFetchingFailed(withError error: Error)
}

protocol UsersCellView {
    func configure(viewModel: UserViewModel)
}
