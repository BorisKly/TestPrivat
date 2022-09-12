//
//  PrivatView.swift
//  Zell
//
//  Created by Boris Klykavka on 29.08.2022.
//

import UIKit

class PrivatView: UIView {
// 44445555
//    weak var delegate: UITableViewDelegate? {
//        didSet {
//            self.myTableView.delegate = delegate
//        }
//    }
//
//    weak var dataSource: UITableViewDataSource? {
//        didSet {
//            self.myTableView.dataSource = dataSource
//        }
//    }

    let tableArray = TableCurrencyArray()

    let picker = UIDatePicker()

    let pickerBackground = UIView()

    weak public var delegate: PrivatViewControllerDelegate?

   // public var newDateHappens: ((Date) -> ())?

    public var myTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return table
    }()

    private let dateCurrLbl: UILabel = {
        let lblField = UILabel()
        lblField.isUserInteractionEnabled = true
        lblField.translatesAutoresizingMaskIntoConstraints = false
        lblField.backgroundColor = Colors.background
        lblField.textAlignment = .center
        lblField.numberOfLines = 2
        lblField.sizeToFit()
        lblField.layer.cornerRadius = CGFloat(CornerRadius.forButtons)
        lblField.text = """
                        Currency Exchange on  \(Date().getFormattedDate(format: .standart))
                        """
        return lblField
    }()

    let dateCurrBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = Colors.background
        btn.setTitleColor(Colors.background8, for: .normal)
        btn.setTitle("Press to change Date", for: .normal)
        btn.setTitle("Pressed...", for: .highlighted)
        btn.tintColor = Colors.tintColor
        btn.layer.cornerRadius = CGFloat(CornerRadius.forButtons)
        btn.addTarget(self, action: #selector(showDatePicker), for: .touchDown)
        btn.clipsToBounds = true
        btn.isHighlighted = false
        return btn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(dateCurrLbl)
        self.addSubview(myTableView)
        self.addSubview(dateCurrBtn)
        self.addSubview(pickerBackground)
        self.addSubview(picker)
      //  self.addGestureRecognizer(tapGesture)
        self.isUserInteractionEnabled = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setupUI() {
        self.createTable()
        self.setConstraints()
        self.setupDatePicker()
    }

    private func setupDatePicker() {
        picker.translatesAutoresizingMaskIntoConstraints = false
        pickerBackground.translatesAutoresizingMaskIntoConstraints = false
        pickerBackground.backgroundColor = Colors.background7

        let fiveYearsEarlierDay = Date(timeIntervalSinceNow: -5 * 365 * 24 * 3600)
        let todayDate = Date()
        picker.minimumDate = fiveYearsEarlierDay
        picker.maximumDate = todayDate

        picker.backgroundColor = Colors.background4
        picker.datePickerMode = .date
        picker.locale = Locale(identifier: Locale.preferredLanguages.first!)
        picker.preferredDatePickerStyle = .wheels
        picker.addTarget(self, action: #selector(dateChanged(paramDatePicker:)), for: .allEvents)
        picker.isHidden = true
        pickerBackground.isHidden = true
    }

    @objc func dateChanged(paramDatePicker: UIDatePicker) {
        guard paramDatePicker.isEqual(self.picker) else { return }
        print("dateChanged := ", paramDatePicker.date)
        dateCurrLbl.text = """
                        Currency Exchange on  \(paramDatePicker.date.getFormattedDate(format: .standart))
                        """
        delegate?.dateChanged(newDate: picker.date)
        //newDateHappens?(picker.date)
    }

    @objc private func showDatePicker() {
        picker.isHidden = false
        pickerBackground.isHidden = false
    }

    private func createTable() {
        myTableView.register(UINib(nibName: "PrivatTableViewCell", bundle: nil), forCellReuseIdentifier: "MyCell")
    }

    @objc private func doneAction() {
        picker.isHidden = true
        pickerBackground.isHidden = true
    }

    //MARK: - Constraints

    private func setConstraints() {

        dateCurrLbl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        dateCurrLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        dateCurrLbl.topAnchor.constraint(equalTo: self.topAnchor, constant: 60).isActive = true
        dateCurrLbl.heightAnchor.constraint(equalToConstant: 40).isActive = true

        dateCurrBtn.trailingAnchor.constraint(equalTo: dateCurrLbl.trailingAnchor).isActive = true
        dateCurrBtn.leadingAnchor.constraint(equalTo: dateCurrLbl.leadingAnchor).isActive = true
        dateCurrBtn.topAnchor.constraint(equalTo: dateCurrLbl.bottomAnchor, constant: 20).isActive = true
        dateCurrBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true

        myTableView.trailingAnchor.constraint(equalTo: dateCurrLbl.trailingAnchor).isActive = true
        myTableView.leadingAnchor.constraint(equalTo: dateCurrLbl.leadingAnchor).isActive = true
        myTableView.topAnchor.constraint(equalTo: dateCurrBtn.bottomAnchor, constant: 20).isActive = true
        myTableView.heightAnchor.constraint(equalToConstant: 400).isActive = true

        picker.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        picker.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        picker.topAnchor.constraint(equalTo: self.dateCurrBtn.bottomAnchor, constant: 20).isActive = true
        picker.heightAnchor.constraint(equalToConstant: 400).isActive = true

        pickerBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        pickerBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        pickerBackground.topAnchor.constraint(equalTo: self.dateCurrBtn.bottomAnchor, constant: 20).isActive = true
        pickerBackground.heightAnchor.constraint(equalToConstant: 400).isActive = true
    }


}
