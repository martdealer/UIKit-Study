//
//  Member.swift
//  MemberList
//
//  Created by zsm on 11/20/23.
//

import UIKit

struct Member {
    
    // 이미지가 없다면 메모리 낭비하지 않도록 lazy 선언
    lazy var memberImage: UIImage? = {
        guard let name = name else { return UIImage(systemName: "person") }
        return UIImage(named: "\(name).png") ?? UIImage(systemName: "person")
    }()
    
    // 총 멤버수. 모든 인스턴스가 같은 값을 가지고 공유해야 하므로 타입변수static 선언
    static var memberNumbers: Int = 0
    
    let memberId: Int
    var name: String?
    var age: Int?
    var phone: String?
    var address: String?
    
    init(name: String?, age: Int?, phone: String?, address: String?) {
        
        self.memberId = Member.memberNumbers
        
        self.name = name
        self.age = age
        self.phone = phone
        self.address = address
        
        Member.memberNumbers += 1
    }
}
