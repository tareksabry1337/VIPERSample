//
//  UsersPresenter.swift
//  VIPER
//
//  Created by Vortex on 4/7/19.
//  Copyright © 2019 Ibtdi. All rights reserved.
//

import Foundation

class UsersPresenter: UsersPresenterProtocol, UsersInteractorOutputProtocol {
    
    weak var view: UsersViewProtocol?
    private let interactor: UsersInteractorInputProtocol
    private let router: UsersRouterProtocol
    private var users = [User]()
    
    var numberOfRows: Int {
        return users.count
    }
    
    init(view: UsersViewProtocol, interactor: UsersInteractorInputProtocol, router: UsersRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        view?.showLoadingIndicator()
        interactor.getUsers()
    }
    
    func usersFetchedSuccessfully(users: [User]) {
        view?.hideLoadingIndicator()
        self.users.append(contentsOf: users)
        view?.reloadData()
    }
    
    func usersFetchingFailed(withError error: Error) {
        view?.hideLoadingIndicator()
        //Failure - Should show alert
    }
    
    func configure(cell: UsersCellView, indexPath: IndexPath) {
        let user = users[indexPath.row]
        let viewModel = UserViewModel(user: user)
        cell.configure(viewModel: viewModel)
    }
}
