//
//  AvatarImageView.swift
//  TheBean
//
//  Created by Илья Чуб on 15.03.2022.
//

import Foundation
import UIKit


class avatarImageView: UIImageView {
    var avatarImage: UIImage
    
    init(avatarImage: UIImage) {
        self.avatarImage = avatarImage
        super.init(frame: .zero)
        setupSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSelf() {
        self.image = self.avatarImage
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFit
    }
}
