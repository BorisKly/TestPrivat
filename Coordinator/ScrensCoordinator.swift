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
//    private func exchangeRates() {
//        let controller =
//            ExchageRatesViewController.startVC()
//        self.navigationController.pushViewController(controller, animated: true)
//    }
//    private func currency() {
//        let controller =
//            CurrencyViewController.startVC()
//        self.navigationController.pushViewController(controller, animated: true)
//    }
//    private func datePicker() {
//        let controller =
//            DatePickerSampleViewController.startVC()
//        controller.eventHandler = { [weak self] event in
//            print(event)
//            switch event {
//            case .currency :
//                self?.jumpToScreen(.currency)
//            case .exchangeRates :
//                self?.jumpToScreen(.exchangeRates)
//            }
//        }
//        self.navigationController.pushViewController(controller, animated: true)
//    }
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
