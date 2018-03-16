//
//  PickerViewManager.swift
//  PickerViewKit
//
//  Created by crelies on 14.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import UIKit

public protocol PickerViewManagerProtocol {
	init(setup: PickerViewSetup)
    func updateComponents(components: [PickerViewComponent])
	func updateValueComponent(with values: [PickerViewRowProtocol])
}

public final class PickerViewManager: PickerViewManagerProtocol {
    private let dataSource: PickerViewDataSourceProtocol
    private let delegate: PickerViewDelegateProtocol
    private weak var pickerView: UIPickerView?
    
    public init(setup: PickerViewSetup) {
        self.pickerView = setup.pickerView
        let dataSource = PickerViewDataSource(components: setup.components)
        self.dataSource = dataSource
        
		let delegate = PickerViewDelegate(dataSource: dataSource,
										  callback: setup.callback,
										  defaultColumnWidth: setup.defaultColumnWidth,
										  defaultRowHeight: setup.defaultRowHeight)
        self.delegate = delegate
        
        pickerView?.dataSource = dataSource
        pickerView?.delegate = delegate
        
        pickerView?.reloadAllComponents()
    }
    
    public func updateComponents(components: [PickerViewComponent]) {
        dataSource.updateComponents(components: components)
        pickerView?.reloadAllComponents()
    }
	
	public func updateValueComponent(with values: [PickerViewRowProtocol]) {
		let valueComponent = 1
		dataSource.updateValues(inComponent: valueComponent, values: values)
		pickerView?.reloadComponent(valueComponent)
	}
}
