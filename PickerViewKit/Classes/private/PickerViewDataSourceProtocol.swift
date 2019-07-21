//
//  PickerViewDataSourceProtocol.swift
//  PickerViewKit
//
//  Created by crelies on 17.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import Foundation

/// Protocol describing the structure of a `PickerViewDataSource`.
///
protocol PickerViewDataSourceProtocol: class, UIPickerViewDataSource {
	var columns: [PickerViewColumn] { get }
	func updateColumns(columns: [PickerViewColumn])
	func updateColumn(atIndex index: Int, column: PickerViewColumn)
	func updateRows(inColumn column: Int, rows: [PickerViewRow])
}
