//
//  InternalPickerViewDelegateProtocol.swift
//  PickerViewKit
//
//  Created by crelies on 17.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import Foundation

/// Protocol specifying the methods of a `PickerViewDelegate`.
///
protocol InternalPickerViewDelegateProtocol: class, UIPickerViewDelegate {
    func getSelectedRows(ofPickerView pickerView: UIPickerView) -> [PickerViewRow]
}
