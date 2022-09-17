//
//  NetworkMeneger.swift
//  Zell
//
//  Created by Boris Klykavka on 04.09.2022.
//

import Foundation
import Alamofire

enum CurrencyToShow: String {
    case usd = "USD"
    case eur = "EUR"
    case gbp = "GBP"
    case chf = "CHF"
 }

class NetworkManager {

    // MARK: - Public Properties

    public static let shared = NetworkManager()

    // MARK: - Init Properties

    private init() {}

    // MARK: - Public Methods

    public func simplePrivatArray(date: Date, onSuccess: @escaping ([TestPrivatData]) -> (), onError: (Error) ->()) {
        let dateR = date.getFormattedDate(format: .standart)
        guard let url = URL(string: "https://api.privatbank.ua/p24api/exchange_rates?json&date=\(dateR)") else { return }
        let task = URLSession.shared.dataTask(with: url ){
            (data, response, error) in
            guard let data = data,
                  let jsonString = try? JSONDecoder().decode(TestPrivatResponseData.self, from: data) else {print("Error - cannot get information from url"); return}
            onSuccess(
                jsonString.exchangeRate.compactMap({ curFirst in
                guard let currency = curFirst.currency else {
                    return nil
                }
                let viewDataFirst = TestPrivatData(
                date: dateR,
                currency: currency,
                saleRate: curFirst.saleRateNB,
                purchaseRate: curFirst.purchaseRateNB
            )
                return viewDataFirst
            }))
        }
        task.resume()
    }
}
