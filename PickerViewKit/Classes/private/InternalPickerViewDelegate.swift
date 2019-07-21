//
//  PickerViewDelegate.swift
//  PickerViewKit
//
//  Created by crelies on 14.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import UIKit

final class InternalPickerViewDelegate: NSObject {
	private weak var dataSource: PickerViewDataSourceProtocol?
    private weak var delegate: PickerViewDelegate?
	private let rowHeight: CGFloat
	
	init(dataSource: PickerViewDataSourceProtocol,
         delegate: PickerViewDelegate? = nil,
         rowHeight: CGFloat) {
		self.dataSource = dataSource
        self.delegate = delegate
		self.rowHeight = rowHeight
    }
}

extension InternalPickerViewDelegate: InternalPickerViewDelegateProtocol {
    func getSelectedRows(ofPickerView pickerView: UIPickerView) -> [PickerViewRow] {
        guard let columns = dataSource?.columns else {
            return []
        }
        
        let numberOfColumns = pickerView.numberOfComponents
        var selectedRows: [PickerViewRow] = []
        if numberOfColumns > 0 {
            for columnIndex in (0...numberOfColumns-1) {
                let selectedRowIndex = pickerView.selectedRow(inComponent: columnIndex)
                let row = columns[columnIndex].rows[selectedRowIndex]
                selectedRows.append(row)
            }
        }
        
        return selectedRows
    }
}

extension InternalPickerViewDelegate: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, widthForComponent column: Int) -> CGFloat {
        guard let columns = dataSource?.columns else {
            return Constants.defaultColumnWidth
        }
        
        guard column >= 0, column < columns.count else {
            return Constants.defaultColumnWidth
        }
        
        let columnWidth = columns[column].columnWidth
        let maximumWidth = pickerView.frame.width / CGFloat(pickerView.numberOfComponents)
        return min(columnWidth, maximumWidth)
    }
    
    /*
        "I tried it and confirm that the row height for all rows in a picker is the largest value returned by the method rowHeoghtForComponent for any row in the picker. I don't think you can do what you want to do."
    */
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent column: Int) -> CGFloat {
        guard let columns = dataSource?.columns, !columns.isEmpty else {
            return 0
        }
        
        return rowHeight
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent column: Int, reusing view: UIView?) -> UIView {
        if let columns = dataSource?.columns, validate(column: column, row: row) {
            let pickerViewRow = columns[column].rows[row]
            return pickerViewRow.view
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
            let selectedRows = getSelectedRows(ofPickerView: pickerView)
            let currentRow = columns[column].rows[row]
            delegate?.didSelectRow(pickerView, selectedRow: currentRow, allSelectedRows: selectedRows)
        } else {
            return
        }
    }
}

extension InternalPickerViewDelegate {
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
