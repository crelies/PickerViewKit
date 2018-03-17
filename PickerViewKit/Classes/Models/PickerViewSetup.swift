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
	
	public init(pickerView: UIPickerView?, type: PickerViewType, callback: PickerViewDelegateCallbackProtocol?, defaultColumnWidth: CGFloat = 48, defaultRowHeight: CGFloat = 48) throws {
		self.pickerView = pickerView
		
		switch type {
			case .single(let component):
				self.components = [component]
			
			case .keyValue(let components):
				guard components.count == 2 else {
					throw PickerViewSetupError.keyValueWrongNumberOfComponents
				}
				
				self.components = components
			
			case .multi(let components):
				self.components = components
		}
		
		self.callback = callback
		self.defaultColumnWidth = defaultColumnWidth
		self.defaultRowHeight = defaultRowHeight
	}
}
