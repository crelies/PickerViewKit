//
//  PickerViewSetup.swift
//  PickerViewKit
//
//  Created by crelies on 15.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import UIKit

public struct PickerViewSetup {
	weak var pickerView: UIPickerView?
	let components: [PickerViewComponent]
	weak var callback: PickerViewDelegateCallbackProtocol?
	let defaultColumnWidth: CGFloat
	let defaultRowHeight: CGFloat
	
	public init(pickerView: UIPickerView?, components: [PickerViewComponent], callback: PickerViewDelegateCallbackProtocol?, defaultColumnWidth: CGFloat = 48, defaultRowHeight: CGFloat = 48) {
		self.pickerView = pickerView
		self.components = components
		self.callback = callback
		self.defaultColumnWidth = defaultColumnWidth
		self.defaultRowHeight = defaultRowHeight
	}
	
	public init(pickerView: UIPickerView?, models: [PickerKeyValueModel], callback: PickerViewDelegateCallbackProtocol?, keyColumnWidth: CGFloat = 48, valueColumnWidth: CGFloat = 48, rowHeight: CGFloat = 48) {
		self.pickerView = pickerView
		self.callback = callback
		
		if models.count > 0 {
			var keyComponent = PickerViewComponent(rows: [], columnWidth: keyColumnWidth, rowHeight: rowHeight)
			for model in models {
				keyComponent.rows.append(model.key)
			}
			let valueComponent = PickerViewComponent(rows: models[0].values, columnWidth: valueColumnWidth, rowHeight: rowHeight)
			
			self.components = [keyComponent, valueComponent]
		} else {
			self.components = []
		}
		
		self.defaultColumnWidth = 48
		self.defaultRowHeight = 48
	}
}
