//
//  FriendTableViewCell.swift
//  IN_SOPT_review
//
//  Created by 정채은 on 2023/02/24.
//

import UIKit

import Then
import SnapKit

class FriendTableViewCell: UITableViewCell {
    
    static let identifier = "FriendTableViewCell"
    
    private let friendContainerView = UIView()
    private let profileImageView = UIImageView()
    private let nameLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
    }
    private let statusLabel = UILabel().then {
        $0.textColor = .systemGray2
        $0.font = .systemFont(ofSize: 11, weight: .regular)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//    }

}

extension FriendTableViewCell {
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        [
            friendContainerView,
            profileImageView,
            nameLabel,
            statusLabel
        ].forEach{
            contentView.addSubview($0)
        }
        friendContainerView.addSubview(profileImageView)
        friendContainerView.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(44)
            $0.height.equalTo(41)
        }
        profileImageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(self.profileImageView.snp.top).offset(6)
            $0.leading.equalTo(self.profileImageView.snp.trailing).offset(11)
        }
        statusLabel.snp.makeConstraints{
            $0.top.equalTo(self.nameLabel.snp.bottom).offset(3)
            $0.leading.equalTo(self.nameLabel.snp.leading)
        }
    }
    func dataBind(model: FriendModel) {
        profileImageView.image = UIImage(named: model.profileImage)
        nameLabel.text = model.name
        statusLabel.text = model.status
    }
}
