//
//  NetworkMeneger.swift
//  Zell
//
//  Created by Boris Klykavka on 04.09.2022.
//

import Foundation

enum CurrencyToShow: String {
    case usd = "USD"
    case eur = "EUR"
    case gbp = "GBP"
    case chf = "CHF"
 }

class NetworkManager {

    public static let shared = NetworkManager()

    private init() {}

    public func simplePrivat(dateR: String, onSuccess: @escaping (TestPrivatData) -> (), onError: (Error) ->()) {
        guard let url = URL(string: "https://api.privatbank.ua/p24api/exchange_rates?json&date=\(dateR)") else { return }
        let task = URLSession.shared.dataTask(with: url ){
            (data, response, error) in
            guard let data = data,
                  let jsonString = try? JSONDecoder().decode(TestPrivatResponseData.self, from: data) else {print("Error - cannot get information from url"); return}
            let currencyToShow = jsonString.exchangeRate.first(where: {$0.currency == CurrencyToShow.eur.rawValue })
            let viewData = TestPrivatData(
                date: dateR,
                currency: currencyToShow?.currency ?? "",
                saleRate: currencyToShow?.saleRate,
                purchaseRate: currencyToShow?.purchaseRate
            )
            print("\(viewData)!!!!!!!!")
            onSuccess(viewData)
        }
        task.resume()
    }

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
