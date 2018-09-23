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
	let columns: [PickerViewColumn]
	weak var delegate: PickerViewDelegateCallbackProtocol?
	let defaultColumnWidth: CGFloat
	let defaultRowHeight: CGFloat
	
	public init(pickerView: UIPickerView, columns: [PickerViewColumn], delegate: PickerViewDelegateCallbackProtocol? = nil, defaultColumnWidth: CGFloat = 48, defaultRowHeight: CGFloat = 48) {
		self.pickerView = pickerView
        self.columns = columns
		self.delegate = delegate
		self.defaultColumnWidth = defaultColumnWidth
		self.defaultRowHeight = defaultRowHeight
	}
}
