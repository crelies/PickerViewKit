//
//  PickerViewComponent.swift
//  PickerViewKit
//
//  Created by crelies on 14.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import Foundation

public struct PickerViewComponent {
	var columnWidth: CGFloat?
	var rowHeight: CGFloat?
    var rows: [PickerViewRowProtocol]
    
    public init(rows: [PickerViewRowProtocol]) {
        self.rows = rows
    }
	
	public init(rows: [PickerViewRowProtocol], columnWidth: CGFloat, rowHeight: CGFloat) {
		self.rows = rows
		self.columnWidth = columnWidth
		self.rowHeight = rowHeight
	}
	
	public init(rows: [PickerViewRowProtocol], columnWidth: CGFloat) {
		self.rows = rows
		self.columnWidth = columnWidth
	}
	
	public init(rows: [PickerViewRowProtocol], rowHeight: CGFloat) {
		self.rows = rows
		self.rowHeight = rowHeight
	}
}
