//
//  PickerViewManager.swift
//  PickerViewKit
//
//  Created by crelies on 14.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import UIKit

/// Manages one picker view instance. The manager creates the data source and
/// delegate of the picker view under the hood. Columns and rows of the
/// managing picker view can be updated.
///
public final class PickerViewManager: PickerViewManagerProtocol {
    private let dataSource: PickerViewDataSourceProtocol
    private let delegate: PickerViewDelegateProtocol
    private weak var pickerView: UIPickerView?
    
    /// Initializes the manager.
    /// The data source and delegate will be created and added to the given picker view.
    /// In addition the type of the picker view is set.
    /// Finally all columns will be reloaded.
    ///
    /// - Parameter setup: setup value containing all configuration parameters
    public init(setup: PickerViewSetup) {
        self.pickerView = setup.pickerView
		self.pickerView?.type = setup.pickerViewType
        let dataSource = PickerViewDataSource(columns: setup.columns)
        self.dataSource = dataSource
        
		let delegate = PickerViewDelegate(dataSource: dataSource,
										  callback: setup.delegate,
										  defaultColumnWidth: setup.defaultColumnWidth,
										  defaultRowHeight: setup.defaultRowHeight)
        self.delegate = delegate
        
        pickerView?.dataSource = dataSource
        pickerView?.delegate = delegate
        
        pickerView?.reloadAllComponents()
    }
    
    
    /// Replaces the existing columns with the given columns.
    /// In preparation of the update the first row of each column will be selected.
    /// Then the data source will be updated and all columns will be reloaded.
    ///
    /// - Parameter columns: the new columns
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
	
    /// Replaces the column at the given index with the specified column.
    /// The first row of the column will be selected before the update.
    /// Finally the data source will be updated and the column will be reloaded.
    ///
    /// - Parameters:
    ///   - index: specifies the index of the column
    ///   - column: the new column
    public func updateColumn(atIndex index: Int, column: PickerViewColumn) {
		if let pickerView = pickerView, index >= 0, index < pickerView.numberOfComponents {
			if pickerView.numberOfComponents > 0 {
				pickerView.selectRow(0, inComponent: index, animated: false)
			}
			dataSource.updateColumn(atIndex: index, column: column)
			pickerView.reloadComponent(index)
		}
	}
	
    /// Updates the rows in the column at the given index with the specified rows.
    /// Selects the first row in the column, updates the rows and reloads the column at the end.
    ///
    /// - Parameters:
    ///   - column: specifies the index of the column
    ///   - rows: the new rows
	public func updateRows(inColumn column: Int, rows: [PickerViewRowProtocol]) {
		if let pickerView = pickerView, column >= 0, column < pickerView.numberOfComponents {
			pickerView.selectRow(0, inComponent: column, animated: false)
			dataSource.updateRows(inColumn: column, rows: rows)
			pickerView.reloadComponent(column)
		}
	}
}
