//
//  MainCoordinator.swift
//  MVVM-iOS
//
//  Created by Sanket Bhamare on 10/10/21.
//

import Foundation
import UIKit

struct MainCoordinator : Coordinator {
    
    var navigationController = UINavigationController()
    var child = [Coordinator]()
    
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
        let vc = BookListVC.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func BookDetailsPage() {
        let vc = BookDetailsVC.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
}
