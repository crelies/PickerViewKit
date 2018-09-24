//
//  PickerViewManagerProtocol.swift
//  PickerViewKit
//
//  Created by crelies on 17.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import Foundation

protocol PickerViewManagerProtocol {
    var selectedRowModels: [PickerViewRowModelProtocol]? { get }
	init(setup: PickerViewSetup)
    func selectRow(inColumn column: Int, row: Int, animated: Bool)
    func selectRowModel(inColumn column: Int, model: PickerViewRowModelProtocol, animated: Bool)
	func updateColumns(columns: [PickerViewColumn])
	func updateColumn(atIndex index: Int, column: PickerViewColumn)
	func updateRows(inColumn column: Int, rows: [PickerViewRowProtocol])
}
