//
//  MockPickerViewDelegate.swift
//  PickerViewKit_Tests
//
//  Created by crelies on 18.03.18.
//  Copyright © 2018 Christian Elies. All rights reserved.
//

import Foundation
import PickerViewKit

final class MockPickerViewDelegate: PickerViewDelegate {
    weak var pickerView: UIPickerView?
    var row: PickerViewRow?
    var allSelectedRows: [PickerViewRow] = []
    
    func didSelectRow(_ pickerView: UIPickerView,
                      selectedRow: PickerViewRow,
                      allSelectedRows: [PickerViewRow]) {
        self.pickerView = pickerView
        self.row = selectedRow
        self.allSelectedRows = allSelectedRows
    }
}
