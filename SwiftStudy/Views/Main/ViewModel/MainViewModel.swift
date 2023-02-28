//
//  MainViewModel.swift
//  SwiftStudy
//
//  Created by Jim on 2023/02/28.
//

import Foundation
import UIKit
import RxSwift

class MainViewModel {
    

    let gotoNext = PublishSubject<Void>()
    
    func buttonTapped(){
        gotoNext.onNext(())
        
    }
}
