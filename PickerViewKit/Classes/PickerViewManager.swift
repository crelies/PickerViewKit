//
//  PickerViewManager.swift
//  PickerViewKit
//
//  Created by crelies on 14.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import UIKit

public final class PickerViewManager: PickerViewManagerProtocol {
    private let dataSource: PickerViewDataSourceProtocol
    private let delegate: PickerViewDelegateProtocol
    private weak var pickerView: UIPickerView?
    
    public init(setup: PickerViewSetup) {
        self.pickerView = setup.pickerView
        let dataSource = PickerViewDataSource(components: setup.components)
        self.dataSource = dataSource
        
		let delegate = PickerViewDelegate(pickerViewType: setup.pickerViewType,
										  dataSource: dataSource,
										  callback: setup.callback,
										  defaultColumnWidth: setup.defaultColumnWidth,
										  defaultRowHeight: setup.defaultRowHeight)
        self.delegate = delegate
        
        pickerView?.dataSource = dataSource
        pickerView?.delegate = delegate
        
        pickerView?.reloadAllComponents()
    }
    
    public func updateComponents(components: [PickerViewComponent]) {
		if let pickerView = pickerView {
			let numberOfComponents = pickerView.numberOfComponents
			if numberOfComponents > 0 {
				for index in (0...numberOfComponents-1) {
					pickerView.selectRow(0, inComponent: index, animated: false)
				}
			}
			dataSource.updateComponents(components: components)
			pickerView.reloadAllComponents()
		}
    }
	
	public func updateRows(inComponent component: Int, rows: [PickerViewRowProtocol]) {
		if let pickerView = pickerView, component >= 0, component < pickerView.numberOfComponents {
			pickerView.selectRow(0, inComponent: component, animated: false)
			dataSource.updateRows(inComponent: component, rows: rows)
			pickerView.reloadComponent(component)
		}
	}
}
