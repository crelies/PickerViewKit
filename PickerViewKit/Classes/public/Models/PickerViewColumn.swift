//
//  PickerViewColumn.swift
//  PickerViewKit
//
//  Created by crelies on 14.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import Foundation

public struct PickerViewColumn {
	var columnWidth: CGFloat
    var rows: [PickerViewRow]
    
    public init(rows: [PickerViewRow]) {
        self.rows = rows
        self.columnWidth = Constants.defaultColumnWidth
    }
	
	public init(rows: [PickerViewRow], columnWidth: CGFloat) {
		self.rows = rows
		self.columnWidth = columnWidth
	}
}

extension PickerViewColumn: Equatable {
    public static func ==(lhs: PickerViewColumn, rhs: PickerViewColumn) -> Bool {
        let equalColumnWidth = lhs.columnWidth == rhs.columnWidth
        let equalRows = lhs.rows == rhs.rows
        return equalColumnWidth && equalRows
    }
}
