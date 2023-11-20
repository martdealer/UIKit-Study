//
//  DetailViewController.swift
//  MemberList
//
//  Created by zsm on 11/20/23.
//

import UIKit

final class DetailViewController: UIViewController {
    
    private let detailView = DetailView()
    
    var member:Member?
    
    
    // super 호출이 필요하지 않은 시점
    override func loadView() {
        view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonAction()
        setupData()
    }
    
    private func setupData() {
        detailView.member = member
    }
    

    func setupButtonAction() {
        detailView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    @objc func saveButtonTapped() {
        print("버튼이 눌림")
    }

}
