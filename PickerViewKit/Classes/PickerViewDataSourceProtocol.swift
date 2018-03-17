//
//  PickerViewDataSourceProtocol.swift
//  PickerViewKit
//
//  Created by crelies on 17.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import Foundation

public protocol PickerViewDataSourceProtocol: class, UIPickerViewDataSource {
	var components: [PickerViewComponent] { get }
	init(components: [PickerViewComponent])
	func updateComponents(components: [PickerViewComponent])
	func updateRows(inComponent component: Int, rows: [PickerViewRowProtocol])
}
