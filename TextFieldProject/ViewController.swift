//
//  ViewController.swift
//  TextFieldProject
//
//  Created by zaehorang on 2023/07/30.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //textField의 delegate를 ViewController로 설정
        textField.delegate = self
        
        configureUI()
        
        //화면 들어가자마자 최초 응답자로 설정 -> 키보드가 바로 올라온다.
        textField.becomeFirstResponder()
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
        
        //Done버튼 누르면 키보드가 내려간다.
        textField.resignFirstResponder()
    }
    
    //텍스트 필드의 입력을 시작할 떄 호출 (시작할지 말지를 물어보는 것)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }

    // 텍스트필드의 입력이 시작되면 호출 (시점)
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
    }
    
    // 텍스트필드에 글자내용이 (한글자 한글자) 입력되거나 지워질때 호출 (허용할지 말지를 물어보는 것)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(#function)
        print("텍스트필드의 입력값: \(string)")
        
        if (textField.text?.count)! + string.count > 10 {
                    return false
                } else {
                    return true
                }

    }
    
    
    // 텍스트필드의 엔터키가 눌러졌을때 호출 (동작할지 말지 물어보는 것)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        
        //엔터키 눌렀을 때 텍스트 입력을 끝내기
        //만약 아무 텍스스가 없으면 아래 함수가 적용된다.
        textField.resignFirstResponder()
        
        return true
    }
    
    // 텍스트필드의 입력이 끝날때 호출 (끝낼지 말지를 물어보는 것)
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function)
        
        // 실제 텍스트필드에 아무것도 입력이 되어 있지 않으면, 입력을 끝내지 못하게
        if textField.text == "" {
            textField.placeholder = "Type Something!"
            return false
        } else {
            return true
        }
        //return true
    }
    
    // 텍스트필드의 입력이 (실제) 끝났을때 호출 (시점)
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        textField.text = ""
        
        //type something으로 바뀌었을때를 대비하여 원래대로 바꾸기
        textField.placeholder = "email"
    }
    
    // 화면에 탭을 감지(UIResponder)하는 메서드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField.resignFirstResponder()
        //self.view.endEditing(true)
    }


}

