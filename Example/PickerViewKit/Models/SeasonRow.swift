//
//  SeasonRow.swift
//  PickerViewKit_Example
//
//  Created by crelies on 15.03.18.
//  Copyright © 2018 Christian Elies. All rights reserved.
//

import Foundation
import PickerViewKit

struct SeasonRow: PickerViewRowProtocol {
	var type: PickerViewRowType
	var model: PickerViewRowModelProtocol?
	
	init(type: PickerViewRowType) {
		self.type = type
	}
	
	init(type: PickerViewRowType, model: PickerViewRowModelProtocol) {
		self.type = type
		self.model = model
	}
}
