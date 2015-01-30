//
//  Extensions.swift
//  BelArt
//
//  Created by Mehdi Sqalli on 30/01/15.
//  Copyright (c) 2015 Mehdi Sqalli. All rights reserved.
//

import Cocoa

extension NSTableColumn {
    func resizeToFitContents()
    {
        let tableView = self.tableView
        let rect = NSMakeRect(0, 0, CGFloat.max, tableView!.rowHeight)
        
        let columns = tableView?.tableColumns as [NSTableColumn]
        let columnIndex = find(columns, self)
        
        var maxSize:CGFloat = 55
        for var i = 0; i < tableView!.numberOfRows; ++i
        {
            let cell = tableView?.preparedCellAtColumn(columnIndex!, row: i)
            let size = cell?.cellSizeForBounds(rect)
            maxSize = max(maxSize, size!.width)
        }
        self.width = maxSize;
    }
}
