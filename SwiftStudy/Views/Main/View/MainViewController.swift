//
//  MainViewController.swift
//  SwiftStudy
//
//  Created by Jim on 2023/02/28.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController {
    
    @IBOutlet weak var oneLabel: UILabel!
    @IBOutlet weak var twoLabel: UILabel!
    @IBOutlet weak var oneTextField: UITextField!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    let disposeBag = DisposeBag()
    let mainViewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startRX()
    }
    
    func startRX(){
//        oneTextField.rx.text.orEmpty.bind(to: oneLabel.rx.text).disposed(by: disposeBag)
        
        oneTextField.rx.text.map{ [weak self] text -> String? in
          guard let text = text else { return nil }
          return "UITextFieldの値：\(text)"
        }.subscribe(onNext: { [weak self] text in
            self?.oneLabel.text = text
            }, onError: { _ in
                print("error")
            }, onCompleted: {
                print("completed")
            }).disposed(by: disposeBag)
        
        
        oneButton.rx.tap.subscribe(onNext: {[weak self] _ in
            self?.twoLabel.text = self?.oneTextField.text
        }, onError:  { error in
            print(error)
        }, onCompleted: {
            print("onCompleted")
        }).disposed(by: disposeBag)
        
        nextButton.rx.tap.bind(to: mainViewModel.gotoNext).disposed(by: disposeBag)
        
        nextButton.rx.tap.subscribe(onNext: {[weak self] in
            let nextView = NextViewController()
            self?.navigationController?.pushViewController(nextView, animated: true)
        }, onError: {error in print(error)},onCompleted: {print("onCompleted")}).disposed(by: disposeBag)
        
        
    }
    
}
