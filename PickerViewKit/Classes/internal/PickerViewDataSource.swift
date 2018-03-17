//
//  PickerViewDataSource.swift
//  PickerViewKit
//
//  Created by crelies on 14.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import UIKit

internal final class PickerViewDataSource: NSObject, PickerViewDataSourceProtocol {
    var components: [PickerViewComponent]
	
    init(components: [PickerViewComponent]) {
        self.components = components
        super.init()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return components.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard component >= 0, component < components.count else {
            return 0
        }
        return components[component].rows.count
    }
}

extension PickerViewDataSource {
	func updateComponents(components: [PickerViewComponent]) {
		self.components = components
	}
	
	func updateRows(inComponent component: Int, rows: [PickerViewRowProtocol]) {
		guard component >= 0, component < components.count else {
			return
		}
		
		self.components[component].rows = rows
	}
}
