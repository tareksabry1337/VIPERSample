//
//  Interactor.swift
//  VIPER
//
//  Created by Vortex on 4/7/19.
//  Copyright © 2019 Ibtdi. All rights reserved.
//

import Foundation

class UsersInteractor: UsersInteractorInputProtocol {
    
    weak var presenter: UsersInteractorOutputProtocol?
    
    private let usersWorker = UsersWorker()
    
    func getUsers() {
        usersWorker.getUsers { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let users):
                self.presenter?.usersFetchedSuccessfully(users: users)
            case .failure(let error):
                self.presenter?.usersFetchingFailed(withError: error)
            }
        }
    }
    
}
