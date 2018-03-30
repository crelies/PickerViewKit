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
	let pickerViewType: PickerViewType
	let columns: [PickerViewColumn]
	weak var delegate: PickerViewDelegateCallbackProtocol?
	let defaultColumnWidth: CGFloat
	let defaultRowHeight: CGFloat
	
	public init(pickerView: UIPickerView, type: PickerViewSetupType, delegate: PickerViewDelegateCallbackProtocol? = nil, defaultColumnWidth: CGFloat = 48, defaultRowHeight: CGFloat = 48) throws {
		self.pickerView = pickerView
		self.pickerViewType = PickerViewType(pickerViewSetupType: type)
		
		switch type {
			case .single(let column):
				self.columns = [column]
			
			case .keyValue(let columns):
				guard columns.count == 2 else {
					throw PickerViewSetupError.keyValueWrongNumberOfColumns
				}
				
				self.columns = columns
			
			case .multi(let columns):
				self.columns = columns
		}
		
		self.delegate = delegate
		self.defaultColumnWidth = defaultColumnWidth
		self.defaultRowHeight = defaultRowHeight
	}
}
