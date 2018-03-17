//
//  PickerViewDelegateCallbackProtocol.swift
//  PickerViewKit
//
//  Created by crelies on 14.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import UIKit

public protocol PickerViewDelegateCallbackProtocol: class {
	func didSelectRow(_ delegate: PickerViewDelegateProtocol, in pickerView: UIPickerView, ofType type: PickerViewType, row: PickerViewRowProtocol, rowModels: [PickerViewRowModelProtocol]?)
}
