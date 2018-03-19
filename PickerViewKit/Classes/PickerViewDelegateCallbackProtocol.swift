//
//  PickerViewDelegateCallbackProtocol.swift
//  PickerViewKit
//
//  Created by crelies on 14.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import UIKit

public protocol PickerViewDelegateCallbackProtocol: class {
	func didSelectRow(_ delegate: PickerViewDelegateProtocol, in pickerView: UIPickerView, row: PickerViewRowProtocol, rowModels: [PickerViewRowModelProtocol]?)
}
