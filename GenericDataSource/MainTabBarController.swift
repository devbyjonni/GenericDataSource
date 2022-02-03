//
//  MainTabBarController.swift
//  GenericDataSource
//
//  Created by Jonni Akesson on 2022-02-03.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    private var modelController: ModelController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        modelController = ModelController()
        
        guard let verticalViewController = viewControllers?.first?.contents as? VerticalViewController,
              let horizontalViewController = viewControllers?.last?.contents as? HorizontalViewController
        else { return }
        
        verticalViewController.modelController = modelController
        horizontalViewController.modelController = modelController
    }
}

extension UIViewController {
    var contents: UIViewController {
        if let navcon = self as? UINavigationController {
            return navcon.visibleViewController ?? self
        } else {
            return self
        }
    }
}
