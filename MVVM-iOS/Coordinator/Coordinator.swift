//
//  Cordinator.swift
//  MVVM-iOS
//
//  Created by Sanket Bhamare on 10/10/21.
//

import Foundation
import UIKit

protocol Coordinator {
    
    var navigationController : UINavigationController { get set }
    var child : [Coordinator] { get set }
    func start()
    
}
