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
    func dateChanged(newDate: Date)
}

class PrivatViewController: UIViewController {

    public var eventHandler: ((PrivatEvent)->())?

    public var model: TableCurrencyArray = TableCurrencyArray()

    private var mainView: PrivatView? {
        return self.view as? PrivatView
    }

    public static func startVC() -> Self {
        return Self.init()
    }

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
//        mainView?.newDateHappens = {
//            self.model.setModel(date: $0) {
//                self.mainView?.myTableView.reloadData()
//            }
//        }
        mainView?.setupUI()
        model.setModel{
            self.mainView?.myTableView.reloadData()
        }
    }

    @objc func tapGestureDone() {
        mainView?.picker.endEditing(true)
        mainView?.picker.isHidden = true
        mainView?.pickerBackground.isHidden = true
    }
}

extension PrivatViewController: PrivatViewControllerDelegate {
    func dateChanged(newDate: Date) {
        model.setModel(date: newDate) {
            self.mainView?.myTableView.reloadData()
        }
        print(newDate.getFormattedDate(format: .standart))
    }
}
