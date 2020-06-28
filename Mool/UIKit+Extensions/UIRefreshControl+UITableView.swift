//
//  UIRefreshControl+UITableView.swift
//  Mool
//
//  Created by Alok Choudhary on 6/26/20.
//  Copyright © 2020 Mt Aden LLC. All rights reserved.
//

import Foundation
/*
extension UIRefreshControl {
    func add(to tableView: UITableView?) {
        if superview != tableView {
            let _setRefreshControl = sel_registerName("_setRefreshControl:")

            if superview != nil {
                let oldTableView = superview
                if (oldTableView is UITableView) {
                    if tableView?.responds(to: _setRefreshControl) ?? false {
                        // UITableView has a _setRefreshControl method
                        tableView?.method(for: _setRefreshControl)
                        oldTableView, _setRefreshControl, nil
                    }
                }

                removeFromSuperview()
            } else {
            // Some future version, UITableView does not have a _setRefreshControl method. So hack it using a UITableViewController
            let superview = oldTableView.superview
            let tvc = UITableViewController()
            tvc.tableView = oldTableView as? UITableView
            tvc.refreshControl = nil
            tvc.tableView = nil
            superview?.addSubview(oldTableView)
        }
        }
        
        if (tableView != nil) {
            tableView?.addSubview(self)

            if tableView.responds(to: setRefreshControl) {
                // UITableView has a _setRefreshControl method
                tableView.method(for: setRefreshControl)
                tableView, setRefreshControl, self
            } else {
                // Some future version, UITableView does not have a _setRefreshControl method. So hack it using a UITableViewController
                let superview = tableView.superview
                let tvc = UITableViewController()
                tvc.tableView = tableView
                tvc.refreshControl = self
                tvc.tableView = nil
                superview?.addSubview(tableView)
            }
        }
    }
}
*/
