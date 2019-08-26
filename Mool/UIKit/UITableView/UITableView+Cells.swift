//
//  UITableView+Cells.swift
//  Mool
//
//  Created by Alok Choudhary on 8/25/19.
//  Copyright © 2019 Mt Aden LLC. All rights reserved.
//

import UIKit

extension UITableView {
    func registerNibForCell<T: UITableViewCell>(_ cell: T.Type) {
        let cellNib = UINib(nibName: T.nameOfClass, bundle: nil)
        register(cellNib, forCellReuseIdentifier: T.nameOfClass)
    }
    
    func registerNibForHeaderFooterView<T: UITableViewHeaderFooterView>(_ view: T.Type) {
        let viewNib = UINib(nibName: T.nameOfClass, bundle: nil)
        register(viewNib, forHeaderFooterViewReuseIdentifier: T.nameOfClass)
    }
    
    func dequeueReusableCellForIndexPath<T: UITableViewCell>(_ indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: T.nameOfClass, for: indexPath) as! T
    }
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T {
        return dequeueReusableHeaderFooterView(withIdentifier: T.nameOfClass) as! T
    }
}
