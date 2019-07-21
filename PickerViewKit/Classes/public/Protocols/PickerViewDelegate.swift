//
//  PickerViewDelegate.swift
//  PickerViewKit
//
//  Created by crelies on 14.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import UIKit

/// Protocol which describes the delegate methods of a `PickerViewDelegate`.
///
public protocol PickerViewDelegate: class {
	func didSelectRow(_ pickerView: UIPickerView,
                      selectedRow: PickerViewRow,
                      allSelectedRows: [PickerViewRow])
}
