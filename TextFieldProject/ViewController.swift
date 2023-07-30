//
//  ViewController.swift
//  TextFieldProject
//
//  Created by zaehorang on 2023/07/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        
        view.backgroundColor = UIColor.gray
        
        textField.borderStyle = .roundedRect     // 텍스트필드 모서리 스타일 설정
        textField.placeholder = "이메일 입력"       // 텍스트필드 설명 작성
        textField.keyboardType = .emailAddress   // 키보드 형식 지정
        textField.returnKeyType = .done          // 키보드 위에 return 키 바꾸기
        textField.clearButtonMode = .always      // 텍스트 모두 지우기 버튼 활성화
        
    }

    @IBAction func doneButtonTapped(_ sender: UIButton) {
    }
    
    
    
}

