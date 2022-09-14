//
//  ArrayTableCurrency.swift
//  Zell
//
//  Created by Boris Klykavka on 04.09.2022.
//

import Foundation

class TableCurrencyArray {

    // MARK: - Properties

    var jsonPB: [TestPrivatData?] = [TestPrivatData]()

    // MARK: - Methods

    public func setModel(date: Date = Date(), onSuccess: @escaping () -> Void) {
        NetworkManager.shared.simplePrivatArray(date: date, onSuccess: { [weak self] jsonPB in
            self?.jsonPB = jsonPB
        DispatchQueue.main.async {
            onSuccess()
        }
    }, onError: { print( $0 )})
    }
}
