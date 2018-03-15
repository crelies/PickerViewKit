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
}
