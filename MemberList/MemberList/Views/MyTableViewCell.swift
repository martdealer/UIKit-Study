//
//  MyTableViewCell.swift
//  MemberList
//
//  Created by zsm on 11/20/23.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    // 멤버라는 변수를 관찰하다가, 변할 때 설정 가능
    var member: Member? {
        didSet {
            guard var member = member else { return }
            mainImageView.image = member.memberImage
            memberNameLabel.text = member.name
            addressLabel.text = member.address
        }
    }

    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let memberNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 5
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    // 코드로 테이블뷰 셀을 찍어낼 때 설정하는 생성자
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupStackView()
    }
    
    func setupStackView() {
        self.addSubview(mainImageView)
        // 셀 위에 스택뷰 올리기
        self.addSubview(stackView)
        // 스택뷰 위에 요소 올리기
        stackView.addArrangedSubview(memberNameLabel)
        stackView.addArrangedSubview(addressLabel)
    }
    
    // 상위의 지정생성자를 재정의한 경우 상위의 필수생성자도 재정의해야함
    // 지정생성자 재정의한 경우 새로운 저장속성이 추가된 상황일 수 있기 때문에 필수생성자가 자동으로 구현되지 않게 됨
    // 애플의 내부 메커니즘을 재정의한 것이기 때문에 어떤 역할을 하는지 세부적인 내용까지 알 수는 없음
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    스토리보드 사용시에만 필요
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

    // 오토레이아웃을 세팅하는 정확한 시점 ( Drawing Cycle )
    override func updateConstraints() {
        setConstraints()
        super.updateConstraints()
    }
    
    // 이미지뷰의 크기를 이용해 원을 그리는 로직이므로 이미지뷰의 크기가 설정된 이후여야 함 ( Drawing Cycle )
    override func layoutSubviews() {
        super.layoutSubviews()
        self.mainImageView.clipsToBounds = true
        self.mainImageView.layer.cornerRadius = self.mainImageView.frame.width / 2
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            mainImageView.heightAnchor.constraint(equalToConstant: 40),
            mainImageView.widthAnchor.constraint(equalToConstant: 40),
            mainImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            mainImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            memberNameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.mainImageView.topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: self.mainImageView.bottomAnchor)
        ])
    }
    
}
