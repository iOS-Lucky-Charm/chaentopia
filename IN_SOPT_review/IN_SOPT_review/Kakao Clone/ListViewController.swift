//
//  ListViewController.swift
//  IN_SOPT_review
//
//  Created by 정채은 on 2023/02/14.
//

import UIKit

class ListViewController: UIViewController {
    
    private let titleLabel : UILabel  = {
        let label = UILabel()
        label.text = "친구"
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    private let settingImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"settings")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

    }
}


