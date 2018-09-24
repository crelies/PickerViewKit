//
//  PickerViewDelegateProtocol.swift
//  PickerViewKit
//
//  Created by crelies on 17.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import Foundation

/// Protocol specifying the methods of a `PickerViewDelegate`.
///
public protocol PickerViewDelegateProtocol: class, UIPickerViewDelegate {
	init(dataSource: PickerViewDataSourceProtocol, callback: PickerViewDelegateCallbackProtocol?, defaultColumnWidth: CGFloat, defaultRowHeight: CGFloat)
    func getSelectedRowModels(ofPickerView pickerView: UIPickerView) -> [PickerViewRowModelProtocol]
}
