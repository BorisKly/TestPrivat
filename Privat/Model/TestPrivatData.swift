//
//  TestPrivatData.swift
//  Zell
//
//  Created by Boris Klykavka on 04.09.2022.
//

import Foundation

// MARK: - TestPrivatData
struct TestPrivatData: Codable {
    let date: String
    let currency: String?
    let saleRate: Double?
    let purchaseRate: Double?
}
