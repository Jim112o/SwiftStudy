//
//  NextViewController.swift
//  SwiftStudy
//
//  Created by Jim on 2023/02/28.
//

import UIKit
import RxSwift
import RxCocoa

class NextViewController: UIViewController {
    
    let nextViewModel = NextViewModel()
    
    
    @IBOutlet weak var backButton: UIButton!
    
    let disoiseBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.rx.tap.bind(to: nextViewModel.dismiss).disposed(by: disoiseBag)
        
        
        backButton.rx.tap.subscribe(onNext: {[weak self] _ in
                self?.navigationController?.popViewController(animated: true)
        }, onError: {error in
            print(error)
        },onCompleted: {
            print("completed.")
        }).disposed(by: disoiseBag)
    
    }

}
