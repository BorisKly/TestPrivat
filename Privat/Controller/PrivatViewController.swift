//
//  PrivatViewController.swift
//  Test
//
//  Created by Boris Klykavka on 28.08.2022.
//

import UIKit

enum PrivatEvent {
}

protocol  PrivatViewControllerDelegate: AnyObject {
    func dateChanged(newDate: Date?)
}

class PrivatViewController: UIViewController {

    // MARK: - Public Properties

    public var eventHandler: ((PrivatEvent)->())?

    public var model: TableCurrencyArray = TableCurrencyArray()

    // MARK: - Privat Properties

    private var mainView: PrivatView? {
        return self.view as? PrivatView
    }

    // MARK: - Init Methods

    public static func startVC() -> Self {
        return Self.init()
    }

    // MARK: - Override Methods

    override func loadView() {
        let codeView = PrivatView(frame: CGRect.zero)
        codeView.backgroundColor = Colors.background7
        self.view = codeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapGestureDone))
        mainView?.myTableView.delegate = self
        mainView?.myTableView.dataSource = self
        mainView?.delegate = self
        mainView?.addGestureRecognizer(tapGesture)
        mainView?.setupUI()
        model.setModel{ [weak self] in
            self?.mainView?.myTableView.reloadData()
        }
    }

    // MARK:  - Methods

    @objc private func tapGestureDone() {
        mainView?.picker.endEditing(true)
        mainView?.picker.isHidden = true
        mainView?.pickerBackground.isHidden = true
        dateChanged(newDate: mainView?.picker.date)
    }
}

// MARK: - Extensions

extension PrivatViewController: PrivatViewControllerDelegate {
    func dateChanged(newDate: Date?) {
        model.setModel(date: newDate ?? Date()) { [weak self] in
            self?.mainView?.myTableView.reloadData()
        }
    }
}
