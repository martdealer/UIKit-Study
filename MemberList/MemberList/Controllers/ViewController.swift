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
    lazy var plusButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNaviBar()
        setupTableView()
        setupTableViewConstraints()
        setupDatas()
    }
    
//    // 업데이트된 정보를 표시하기 위해
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        tableView.reloadData()
//    }
    
    // 내비게이션 바 설정
    func setupNaviBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        // 내비게이션바의 오른쪽 버튼 할당
        self.navigationItem.rightBarButtonItem = self.plusButton
    }
    
    // 테이블뷰 기본설정
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
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
    
    // 멤버를 추가하기 위한 다음 화면으로 이동
    @objc func plusButtonTapped() {
        // 다음화면으로 이동 (멤버는 전달하지 않음)
        let detailVC = DetailViewController()
        
        // 다음 화면의 대리자 설정 (다음 화면의 대리자는 지금 현재의 뷰컨트롤러)
        //detailVC.delegate = self
        
        // 화면이동
        navigationController?.pushViewController(detailVC, animated: true)
        //show(detailVC, sender: nil)
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

extension ViewController: UITableViewDelegate {
    
    // 여기에 다음 화면으로 넘어갈 코드 구현
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = DetailViewController()
        detailVC.delegate = self
        
        let array = memberListManager.getMemberList()
        detailVC.member = array[indexPath.row]
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension ViewController: MemberDelegate {
    func addNewMember(_ member: Member) {
        memberListManager.makeNewMember(member)
        tableView.reloadData()
    }
    
    func update(index: Int, _ member: Member) {
        memberListManager.updateMemberInfo(index: index, member)
        tableView.reloadData()
    }
    
    
}
