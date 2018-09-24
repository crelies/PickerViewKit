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
    
    /// Row models of the currently selected rows
    ///
    public var selectedRowModels: [PickerViewRowModelProtocol]? {
        guard let pickerView = pickerView else {
            return nil
        }
        
        return delegate.getSelectedRowModels(ofPickerView: pickerView)
    }
    
    /// Initializes the manager.
    /// The data source and delegate will be created and added to the given picker view.
    /// Finally all columns will be reloaded.
    ///
    /// - Parameter setup: setup value containing all configuration parameters
    public init(setup: PickerViewSetup) {
        self.pickerView = setup.pickerView
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
    
    /// Selects the given row in the given column
    ///
    /// - Parameter column: the related column
    /// - Parameter row: the row to select
    /// - Parameter animated: boolean indicating if the row selection should be animated
    public func selectRow(inColumn column: Int, row: Int, animated: Bool) {
        guard column >= 0, column < dataSource.columns.count else {
            return
        }
        
        let columnObject = dataSource.columns[column]
        guard row >= 0, row < columnObject.rows.count else {
            return
        }
        
        pickerView?.selectRow(row, inComponent: column, animated: animated)
    }
    
    /// Selects the row with the given model if the row exists
    ///
    /// - Parameter column: the related column
    /// - Parameter model: the related row model
    /// - Parameter animated: boolean indicating if the row selection should be animated
    public func selectRowModel(inColumn column: Int, model: PickerViewRowModelProtocol, animated: Bool) {
        guard column >= 0, column < dataSource.columns.count else {
            return
        }
        
        let columnObject = dataSource.columns[column]
        guard let rowIndex = columnObject.rows.firstIndex(where: { $0.model?.name == model.name }) else {
            return
        }
        
        pickerView?.selectRow(rowIndex, inComponent: column, animated: animated)
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
