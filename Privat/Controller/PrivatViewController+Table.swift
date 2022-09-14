//
//  PrivatViewController+Table.swift
//  Zell
//
//  Created by Boris Klykavka on 05.09.2022.
//

import UIKit

extension PrivatViewController: UITableViewDataSource, UITableViewDelegate {

    // MARK: - Private Properties
    
    private var  indentifire: String { "MyCell" }

    //MARK: - UITableViewDataSourse

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return model.jsonPB.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: indentifire, for: indexPath) as? PrivatTableViewCell
            let number = model.jsonPB[indexPath.row]
            cell?.currency?.text = number?.currency
            cell?.rate?.text = String(number?.saleRate ?? 0 )
            cell?.backgroundColor = Colors.background3
            return cell ?? UITableViewCell()
        }
    //MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let ownerCell = tableView.cellForRow(at: indexPath)
    }

}
