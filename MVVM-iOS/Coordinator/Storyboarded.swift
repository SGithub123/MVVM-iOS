//
//  Storyboarded.swift
//  MVVM-iOS
//
//  Created by Sanket Bhamare on 10/10/21.
//

import Foundation
import UIKit

protocol Storyboarded {
    static func instatiate() -> Self
}


extension Storyboarded where Self : UIViewController {
    static func instantiate() -> Self {
        let id  = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(identifier: id) as! Self
    }
}
