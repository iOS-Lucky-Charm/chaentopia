//
//  NewAccountViewController.swift
//  IN_SOPT_review
//
//  Created by 정채은 on 2023/02/09.
//

import UIKit
import SnapKit
import SwiftyColor


class NewAccountViewController: UIViewController {
    
    private let startLabel: UILabel = {
        let label = UILabel()
        label.text = "카카오톡을 시작합니다."
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none

        textField.attributedPlaceholder = NSAttributedString(
            string: "이메일 또는 전화번호",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray2]
        )
        textField.autocapitalizationType = .none
        textField.font = .systemFont(ofSize: 17)
        textField.textColor = .black
        return textField
    }()
    
    private let emailUnderlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray2
        return view
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.attributedPlaceholder = NSAttributedString(
            string: "비밀번호",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray2]
        )
        textField.font = .systemFont(ofSize: 17)
        textField.textColor = .black
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let passwordUnderlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray2
        return view
    }()
    
    private let passwordCheckTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.attributedPlaceholder = NSAttributedString(
            string: "비밀번호 확인",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray2]
        )
        textField.font = .systemFont(ofSize: 17)
        textField.textColor = .black
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let passwordCheckUnderlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray2
        return view
    }()
    
    private lazy var newaccountButton : UIButton = {
        let button = UIButton()
        button.setTitle("새로운 카카오계정 만들기", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = 0xF6F6F6.color
        button.addTarget(self, action: #selector(touchupNewAccountButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
    
    private func presentToWelcomeVC() {
        let welcomeVC = WelcomeViewController()
        welcomeVC.modalPresentationStyle = .formSheet
        self.present(welcomeVC, animated: true, completion: nil)
        if let email = emailTextField.text{
            welcomeVC.dataBind(result: email)
        }
    }
    
    @objc
    private func touchupNewAccountButton() {
        presentToWelcomeVC()
        self.navigationController?.popViewController(animated: true)
        
    }

}

extension NewAccountViewController {
    private func layout() {
        let components : [Any] = [startLabel, emailTextField, emailUnderlineView, passwordTextField, passwordUnderlineView, passwordCheckTextField, passwordCheckUnderlineView,newaccountButton]
        components.forEach {
            view.addSubview($0 as! UIView)
        }
        
        startLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(84)
            make.centerX.equalToSuperview()
        }
        emailTextField.snp.makeConstraints{ make in
            make.top.equalTo(self.startLabel.snp.bottom).offset(116)
//            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(21)
            make.trailing.equalToSuperview().offset(21)
//            make.width.equalTo(300)
        }
        emailUnderlineView.snp.makeConstraints { make in
            make.top.equalTo(self.emailTextField.snp.bottom).offset(13)
            make.width.equalTo(333)
            make.centerX.equalToSuperview()
            make.height.equalTo(1)
        }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(self.emailTextField.snp.bottom).offset(36)
            make.leading.trailing.equalTo(21)
//            make.width.equalTo(300)
        }
        passwordUnderlineView.snp.makeConstraints { make in
            make.top.equalTo(self.passwordTextField.snp.bottom).offset(13)
            make.width.equalTo(333)
            make.centerX.equalToSuperview()
            make.height.equalTo(1)
        }
        passwordCheckTextField.snp.makeConstraints { make in
            make.top.equalTo(self.passwordTextField.snp.bottom).offset(36)
            make.leading.trailing.equalTo(21)
//            make.width.equalTo(300)
        }
        passwordCheckUnderlineView.snp.makeConstraints { make in
            make.top.equalTo(self.passwordCheckTextField.snp.bottom).offset(13)
            make.width.equalTo(333)
            make.centerX.equalToSuperview()
            make.height.equalTo(1)
        }
        newaccountButton.snp.makeConstraints { make in
            make.top.equalTo(self.passwordCheckUnderlineView.snp.bottom).offset(26)
            make.width.equalTo(333)
            make.height.equalTo(44)
            make.centerX.equalToSuperview()
        }
    }
}

