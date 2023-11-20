//
//  ViewController.swift
//  MemberList
//
//  Created by zsm on 11/20/23.
//

import UIKit

final class ViewController: UIViewController {
    
    private let tableView = UITableView()
    var memberListManager = MemberListManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNaviBar()
        setupTableView()
        setupTableViewConstraints()
        setupDatas()
    }
    
    // 내비게이션 바 설정
    func setupNaviBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    // 테이블뷰 기본설정
    func setupTableView() {
        tableView.dataSource = self
        // 테이블뷰 셀 높이
        tableView.rowHeight = 60
        
        // 메타타입
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MemberCell")
    }
    
    // 테이블뷰 오토레이아웃 설정
    func setupTableViewConstraints() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }

    // 더미 데이터 생성
    func setupDatas() {
        memberListManager.makeMembersListData()
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberListManager.getMemberList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath) as! MyTableViewCell
        
        //        아래 설정들을 didSet으로 구현
        //        cell.mainImageView.image = memberListManager[indexPath.row].memberImage
        //        cell.memberNameLabel.text = memberListManager[indexPath.row].name
        //        cell.addressLabel.text = memberListManager[indexPath.row].address
        
        // 설정이 바뀌기 때문에 didSet 실행됨
        cell.member = memberListManager[indexPath.row]
        cell.selectionStyle = .none
        

        
        return cell
    }
    
    
}
