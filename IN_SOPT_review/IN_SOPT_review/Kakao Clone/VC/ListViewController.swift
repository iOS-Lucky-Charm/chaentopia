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
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "정채은"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private let nowLabel : UILabel = {
        let label = UILabel()
        label.text = "아요를 뿌시고 싶다.."
        label.font = .systemFont(ofSize: 11, weight: .regular)
        label.textColor = .systemGray2
        return label
    }()
    
    private let lineView : UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()
    
    private let settingImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"settings")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var profileButton : UIButton = {
        let button = UIButton()
        button.addTarget(self, action:
                            #selector(touchupProfileButton), for: .touchUpInside)
        button.setBackgroundImage(UIImage(named: "profile_userImg"), for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()

    }
    func dataBind(result:String) {
        nameLabel.text = "\(result)"
        
    }
}

extension ListViewController {
    private func layout() {
        let components : [Any] = [
        titleLabel,
        nameLabel,
        nowLabel,
        lineView,
        settingImageView,
        profileButton
        ]
        components.forEach{
            view.addSubview($0 as! UIView)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(56)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(14)
        }
        
        settingImageView.snp.makeConstraints { make in
            make.top.equalTo(self.titleLabel.snp.top).offset(1)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(57)
        }
        profileButton.snp.makeConstraints { make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(26)
            make.leading.equalTo(self.titleLabel.snp.leading)
            make.height.equalTo(59)
            make.width.equalTo(58)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.profileButton.snp.top).offset(12)
            make.leading.equalTo(self.profileButton.snp.trailing).inset(-11)
        }
        nowLabel.snp.makeConstraints { make in
            make.top.equalTo(self.nameLabel.snp.bottom).offset(6)
            make.leading.equalTo(self.nameLabel.snp.leading)
        }
        lineView.snp.makeConstraints { make in
            make.top.equalTo(self.profileButton.snp.bottom).offset(7)
            make.leading.trailing.equalTo(16)
            make.height.equalTo(1)
        }
    }
    @objc
    private func touchupProfileButton() {
        
        presentToProfileVC()
    }
    
    private func presentToProfileVC() {
        let profileVC = ProfileViewController()
        profileVC.modalPresentationStyle = .formSheet
        self.present(profileVC, animated: true, completion: nil)
//        if let email = emailTextField.text{
//            profileVC.dataBind(result: email)
//        }
    }
}


