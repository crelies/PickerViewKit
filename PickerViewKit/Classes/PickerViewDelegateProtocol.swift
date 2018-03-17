//
//  PickerViewDelegateProtocol.swift
//  PickerViewKit
//
//  Created by crelies on 17.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import Foundation

public protocol PickerViewDelegateProtocol: class, UIPickerViewDelegate {
	init(pickerViewType: PickerViewType, dataSource: PickerViewDataSourceProtocol, callback: PickerViewDelegateCallbackProtocol?, defaultColumnWidth: CGFloat, defaultRowHeight: CGFloat)
}
