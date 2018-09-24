//
//  PickerViewDelegate.swift
//  PickerViewKit
//
//  Created by crelies on 14.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import UIKit

final class PickerViewDelegate: NSObject, PickerViewDelegateProtocol {
	private weak var dataSource: PickerViewDataSourceProtocol?
    private weak var callback: PickerViewDelegateCallbackProtocol?
	private let defaultColumnWidth: CGFloat
	private let defaultRowHeight: CGFloat
	
	init(dataSource: PickerViewDataSourceProtocol, callback: PickerViewDelegateCallbackProtocol? = nil, defaultColumnWidth: CGFloat, defaultRowHeight: CGFloat) {
		self.dataSource = dataSource
        self.callback = callback
		self.defaultColumnWidth = defaultColumnWidth
		self.defaultRowHeight = defaultRowHeight
    }
    
    func getSelectedRowModels(ofPickerView pickerView: UIPickerView) -> [PickerViewRowModelProtocol] {
        guard let columns = dataSource?.columns else {
            return []
        }
        
        let numberOfColumns = pickerView.numberOfComponents
        var selectedRowModels: [PickerViewRowModelProtocol] = []
        if numberOfColumns > 0 {
            for columnIndex in (0...numberOfColumns-1) {
                let selectedRowIndex = pickerView.selectedRow(inComponent: columnIndex)
                let row = columns[columnIndex].rows[selectedRowIndex]
                if let rowModel = row.model {
                    selectedRowModels.append(rowModel)
                }
            }
        }
        return selectedRowModels
    }
}

extension PickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, widthForComponent column: Int) -> CGFloat {
        guard let columns = dataSource?.columns else {
            return defaultColumnWidth
        }
        
        guard column >= 0, column < columns.count else {
            return defaultColumnWidth
        }
        
        guard let widthForColumn = columns[column].columnWidth else {
            return defaultColumnWidth
        }
        
        return widthForColumn
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent column: Int) -> CGFloat {
        guard let columns = dataSource?.columns else {
            return defaultRowHeight
        }
        
        guard column >= 0, column < columns.count else {
            return defaultRowHeight
        }
        
        guard let rowHeightForColumn = columns[column].rowHeight else {
            return defaultRowHeight
        }
        
        return rowHeightForColumn
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent column: Int, reusing view: UIView?) -> UIView {
        if let columns = dataSource?.columns, validate(column: column, row: row) {
            let pickerViewRow = columns[column].rows[row]
            return pickerViewRow.getView()
        } else if let previousView = view {
            return previousView
        } else {
            return UIView()
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent column: Int) {
        guard let columns = dataSource?.columns else {
            return
        }
        
        if validate(column: column, row: row) {
            let selectedRowModels = getSelectedRowModels(ofPickerView: pickerView)
            let rowModels = selectedRowModels.isEmpty ? [] : selectedRowModels
            let currentRowModel = columns[column].rows[row]
            callback?.didSelectRow(self, in: pickerView, selectedRow: currentRowModel, selectedRowModels: rowModels)
        } else {
            return
        }
    }
}

extension PickerViewDelegate {
    private func validate(column: Int, row: Int) -> Bool {
        guard let columns = dataSource?.columns else {
            return false
        }
        
        guard column >= 0, column < columns.count else {
            return false
        }
        
        guard row >= 0, row < columns[column].rows.count else {
            return false
        }
        
        return true
    }
}
