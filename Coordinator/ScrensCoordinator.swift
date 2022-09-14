//
//  ScrensCoordinator.swift
//  Zell
//
//  Created by Boris Klykavka on 29.08.2022.
//

import UIKit

enum AvailableScreens {
    case privat
}
final class ScreensCoordinator: Coordinator {
    // MARK: -
    // MARK: Constants
    public let navigationController: UINavigationController
    // MARK: -
    // MARK: Properties
    private var navigationScreens: [AvailableScreens] = []
    // MARK: -
    // MARK: Init and Deinit
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    public func start() {
        self.jumpToScreen(.privat)    //
    }
    // MARK: -
    // MARK: Methods

    private func privat() {
        let controller =
            PrivatViewController.startVC()
        self.navigationController.pushViewController(controller, animated: true)
    }
}
// MARK: -
// MARK: Extensions
extension ScreensCoordinator {
    public func jumpToScreen(_ jumpTo: AvailableScreens) {
        switch jumpTo {
        case .privat:
            self.privat()
        }
    }
}
