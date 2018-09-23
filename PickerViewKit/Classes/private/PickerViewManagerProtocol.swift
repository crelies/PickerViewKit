//
//  PickerViewManagerProtocol.swift
//  PickerViewKit
//
//  Created by crelies on 17.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import Foundation

internal protocol PickerViewManagerProtocol {
	init(setup: PickerViewSetup)
	func updateColumns(columns: [PickerViewColumn])
	func updateColumn(atIndex index: Int, column: PickerViewColumn)
	func updateRows(inColumn column: Int, rows: [PickerViewRowProtocol])
}
