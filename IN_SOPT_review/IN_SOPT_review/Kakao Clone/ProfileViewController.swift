//
//  ProfileViewController.swift
//  IN_SOPT_review
//
//  Created by 정채은 on 2023/02/17.
//

import UIKit

class ProfileViewController: UIViewController {
    private lazy var closeButton : UIButton = {
        let button = UIButton()
        button.addTarget(self, action:
                            #selector(touchupCloseButton), for: .touchUpInside)
        button.setBackgroundImage(UIImage(named: "profile_closeBtn"), for: .normal)
        return button
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"profile_userImg")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "정채은"
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let lineView : UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray2
        return view
    }()

    private let chatButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName:"profileTalkImg"), for: .normal)
        button.titleLabel?.font = UIFont(name: "나와의 채팅", size: 10) ?? .systemFont(ofSize: 10, weight: .regular)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.6)
    }
}

extension ProfileViewController {
    private func layout() {
        let components : [Any] = [
        closeButton,
        profileImageView,
        nameLabel,
        lineView,
        chatButton
        ]
        components.forEach{
            view.addSubview($0 as! UIView)
        }
        closeButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(38)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(18)
            make.height.equalTo(14)
            make.width.equalTo(13)
        }
        profileImageView.snp.makeConstraints { make in
            make.bottom.equalTo(self.nameLabel.snp.top).offset(-8)
            make.centerX.equalToSuperview()
            make.width.equalTo(97)
            make.height.equalTo(96)
        }
        nameLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self.lineView.snp.top).offset(-42)
            make.centerX.equalToSuperview()
        }
        lineView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(131)
            make.width.equalToSuperview()
            make.height.equalTo(1)
        }
        chatButton.snp.makeConstraints { make in
            make.top.equalTo(self.lineView.snp.bottom).offset(36)
            make.leading.equalToSuperview().offset(83)
            make.width.height.equalTo(56)
        }
        
    }
    @objc
    private func touchupCloseButton() {
        self.dismiss(animated:true, completion: nil)
    }

    
}
