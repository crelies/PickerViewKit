//
//  PickerViewDataSource.swift
//  PickerViewKit
//
//  Created by crelies on 14.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import UIKit

final class PickerViewDataSource: NSObject, PickerViewDataSourceProtocol {
    var columns: [PickerViewColumn]
	
    init(columns: [PickerViewColumn]) {
        self.columns = columns
        super.init()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return columns.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent column: Int) -> Int {
        guard column >= 0, column < columns.count else {
            return 0
        }
        return columns[column].rows.count
    }
}

extension PickerViewDataSource {
	func updateColumns(columns: [PickerViewColumn]) {
		self.columns = columns
	}
	
	func updateColumn(atIndex index: Int, column: PickerViewColumn) {
		guard index >= 0, index < columns.count else {
			return
		}
		self.columns[index] = column
	}
	
	func updateRows(inColumn column: Int, rows: [PickerViewRowProtocol]) {
		guard column >= 0, column < columns.count else {
			return
		}
		
		self.columns[column].rows = rows
	}
}
