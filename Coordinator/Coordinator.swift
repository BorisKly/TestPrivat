//
//  Coordinator.swift
//  Zell
//
//  Created by Boris Klykavka on 29.08.2022.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
    func start()
}

