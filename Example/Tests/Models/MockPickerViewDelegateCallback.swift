//
//  MockPickerViewDelegateCallback.swift
//  PickerViewKit_Tests
//
//  Created by crelies on 18.03.18.
//  Copyright © 2018 Christian Elies. All rights reserved.
//

import Foundation
import PickerViewKit

final class MockPickerViewDelegateCallback: PickerViewDelegateCallbackProtocol {
    weak var delegate: PickerViewDelegateProtocol?
    weak var pickerView: UIPickerView?
    var row: PickerViewRowProtocol?
    var selectedRowModels: [PickerViewRowModelProtocol]?
    
    func didSelectRow(_ delegate: PickerViewDelegateProtocol, in pickerView: UIPickerView, selectedRow: PickerViewRowProtocol, selectedRowModels: [PickerViewRowModelProtocol]?) {
        self.delegate = delegate
        self.pickerView = pickerView
        self.row = selectedRow
        self.selectedRowModels = selectedRowModels
    }
}
