//
//  SecondViewController.swift
//  BMI
//
//  Created by zsm on 11/7/23.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var bmiNumberLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    // 전화면에서 전달받은 데이터들
    var bmi:BMI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        // 전화면에서 전달받은 데이터들을 통해 셋팅
        guard let bmi = bmi else { return }
        bmiNumberLabel.text = "\(bmi.value)"
        bmiNumberLabel.backgroundColor = bmi.matchColor
        adviceLabel.text = bmi.advice
        
        
    }
    
    // UI셋팅
    func configureUI() {
        bmiNumberLabel.clipsToBounds = true
        bmiNumberLabel.layer.cornerRadius = 8
        //bmiNumberLabel.backgroundColor = UIColor.brown

        backButton.layer.cornerRadius = 5
    }
    
    // 다시 계산하기 버튼 눌렀을때
    @IBAction func backButtonTapped(_ sender: UIButton) {
        // 전화면으로 돌아가는 메서드
        self.dismiss(animated: true, completion: nil)
    }
    


}
