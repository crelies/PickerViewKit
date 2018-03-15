//
//  PickerViewDataSource.swift
//  PickerViewKit
//
//  Created by crelies on 14.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import UIKit

public protocol PickerViewDataSourceProtocol: class, UIPickerViewDataSource {
    var components: [PickerViewComponent] { get }
    init(components: [PickerViewComponent])
    func getModel(forRow row: Int, inComponent component: Int) -> PickerViewRowProtocol?
    func updateComponents(components: [PickerViewComponent])
	func updateValues(inComponent component: Int, values: [PickerViewRowProtocol])
}

public final class PickerViewDataSource: NSObject, PickerViewDataSourceProtocol {
    public var components: [PickerViewComponent]
    
    public init(components: [PickerViewComponent]) {
        self.components = components
        super.init()
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return components.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard component >= 0, component < components.count else {
            return 0
        }
        return components[component].rows.count
    }
    
    public func getModel(forRow row: Int, inComponent component: Int) -> PickerViewRowProtocol? {
        guard component >= 0, component < components.count else {
            return nil
        }
        
        guard row >= 0, row < components[component].rows.count else {
            return nil
        }
        
        return components[component].rows[row]
    }
    
    public func updateComponents(components: [PickerViewComponent]) {
        self.components = components
    }
	
	public func updateValues(inComponent component: Int, values: [PickerViewRowProtocol]) {
		guard component >= 0, component < components.count else {
			return
		}
	
		self.components[component].rows = values
	}
}
