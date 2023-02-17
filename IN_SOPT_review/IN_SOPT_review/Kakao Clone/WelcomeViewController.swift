//
//  WelcomeViewController.swift
//  IN_SOPT_review
//
//  Created by 정채은 on 2023/02/09.
//

import UIKit
import SnapKit
import SwiftyColor


class WelcomeViewController: UIViewController {
    
    private let welcomeLabel : UILabel = {
        let label = UILabel()
        label.text = "님\n환영합니다"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.numberOfLines = 2
        label.textColor = .black
        return label
    }()
    private lazy var completeButton : UIButton = {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = 0xFBE54C.color
        button.addTarget(self, action: #selector(touchupCompleteButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
    func dataBind(result:String) {
        welcomeLabel.text = "\(result)님\n환영합니다"
    }
    @objc
    private func touchupCompleteButton() {
        self.dismiss(animated: true, completion: nil)
    }
}
extension WelcomeViewController {
    private func layout() {
        let components : [Any] = [welcomeLabel, completeButton]
        components.forEach {
            view.addSubview($0 as! UIView)
        }
        welcomeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(241)
        }
        completeButton.snp.makeConstraints { make in
            make.top.equalTo(self.welcomeLabel.snp.bottom).offset(117)
            make.width.equalTo(333)
            make.height.equalTo(44)
            make.centerX.equalToSuperview()
        }
        
    }
}
