//
//  PickerViewDelegateCallbackProtocol.swift
//  PickerViewKit
//
//  Created by crelies on 14.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import UIKit

/// Protocol which describes the callback methods of a `PickerViewDelegate`.
///
public protocol PickerViewDelegateCallbackProtocol: class {
	func didSelectRow(_ delegate: PickerViewDelegateProtocol, in pickerView: UIPickerView, selectedRow: PickerViewRowProtocol, selectedRowModels: [PickerViewRowModelProtocol]?)
}
