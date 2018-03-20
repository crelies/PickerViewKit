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
		self.pickerView?.type = setup.pickerViewType
        let dataSource = PickerViewDataSource(columns: setup.columns)
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
    
    public func updateColumns(columns: [PickerViewColumn]) {
		if let pickerView = pickerView {
			let numberOfColumns = pickerView.numberOfComponents
			if numberOfColumns > 0 {
				for index in (0...numberOfColumns-1) {
					pickerView.selectRow(0, inComponent: index, animated: false)
				}
			}
			dataSource.updateColumns(columns: columns)
			pickerView.reloadAllComponents()
		}
    }
	
	public func updateRows(inColumn column: Int, rows: [PickerViewRowProtocol]) {
		if let pickerView = pickerView, column >= 0, column < pickerView.numberOfComponents {
			pickerView.selectRow(0, inComponent: column, animated: false)
			dataSource.updateRows(inColumn: column, rows: rows)
			pickerView.reloadComponent(column)
		}
	}
}
