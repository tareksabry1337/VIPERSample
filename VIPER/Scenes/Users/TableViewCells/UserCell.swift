//
//  UserCell.swift
//  VIPER
//
//  Created by Vortex on 4/7/19.
//  Copyright © 2019 Ibtdi. All rights reserved.
//

import UIKit
import Kingfisher

class UserCell: UITableViewCell, UsersCellView {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var registrationDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        setupImageView()
    }
    
    private func setupImageView() {
        userImageView.layer.cornerRadius = userImageView.frame.height / 2
    }
    
    func configure(viewModel: UserViewModel) {
        userImageView.kf.setImage(with: viewModel.avatar)
        userName.text = viewModel.fullName
        registrationDate.text = viewModel.registrationDate
    }
    
}
