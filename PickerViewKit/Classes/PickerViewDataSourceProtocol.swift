//
//  PickerViewDataSourceProtocol.swift
//  PickerViewKit
//
//  Created by crelies on 17.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import Foundation

public protocol PickerViewDataSourceProtocol: class, UIPickerViewDataSource {
	var columns: [PickerViewColumn] { get }
	init(columns: [PickerViewColumn])
	func updateColumns(columns: [PickerViewColumn])
	func updateRows(inColumn column: Int, rows: [PickerViewRowProtocol])
}
