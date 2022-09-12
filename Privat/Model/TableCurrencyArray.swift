//
//  ArrayTableCurrency.swift
//  Zell
//
//  Created by Boris Klykavka on 04.09.2022.
//

import Foundation

class TableCurrencyArray {

    var jsonPB: [TestPrivatData?] = [TestPrivatData]()

    public func setModel(date: Date = Date(), onSuccess: @escaping () -> Void) {
        NetworkManager.shared.simplePrivatArray(date: date, onSuccess: { jsonPB in
        self.jsonPB = jsonPB
        DispatchQueue.main.async {
            print("OK!!!OK")
            onSuccess()
        }
    }, onError: { print( $0 )})
    }
}
