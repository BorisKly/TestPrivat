//
//  TestPrivatResponseData.swift
//  Zell
//
//  Created by Boris Klykavka on 04.09.2022.
//

import Foundation

// MARK: - TestPrivatResponseData
struct TestPrivatResponseData: Codable {
    let date: String
    let bank: String
    let baseCurrency: Int
    let baseCurrencyLit: String
    var exchangeRate: [ExchangeRate]
}


// MARK: - ExchangeResponseRate
struct ExchangeRate: Codable {
    let baseCurrency: String
    let currency: String?
    let saleRateNB: Double?
    let purchaseRateNB: Double?
    let saleRate: Double?
    let purchaseRate: Double?
}

