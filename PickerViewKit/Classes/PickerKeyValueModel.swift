//
//  PickerKeyValueModel.swift
//  PickerViewKit
//
//  Created by crelies on 15.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import Foundation

public struct PickerKeyValueModel {
	let key: PickerViewRowProtocol
	let values: [PickerViewRowProtocol]
	
	public init(key: PickerViewRowProtocol, values: [PickerViewRowProtocol]) {
		self.key = key
		self.values = values
	}
}
