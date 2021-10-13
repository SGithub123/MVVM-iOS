//
//  XIbed.swift
//  MVVM-iOS
//
//  Created by Sanket Bhamare on 10/10/21.
//

import Foundation
import UIKit

public protocol XIBed {
    static func instantiate() -> Self
}

public extension XIBed where Self: UIViewController {
    static func instantiate() -> Self {
        return Self(nibName: String(describing: self), bundle: Bundle(for: Self.self))
    }
}
