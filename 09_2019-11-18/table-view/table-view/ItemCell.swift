//
//  ItemCell.swift
//  table-view
//
//  Created by Павел Усов on 20.11.2019.
//  Copyright © 2019 Pavel Usov. All rights reserved.
//

import UIKit

protocol CellIdentifiable {
    static var identifier: String { get }
}

extension UITableViewCell: CellIdentifiable {

    static var identifier: String {
        return String(describing: Self.self)
    }

}


class ItemCell: UITableViewCell {

    @IBOutlet var labelView: UILabel!

}
