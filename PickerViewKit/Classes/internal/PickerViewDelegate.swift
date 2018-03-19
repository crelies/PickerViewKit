//
//  PickerViewDelegate.swift
//  PickerViewKit
//
//  Created by crelies on 14.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import UIKit

internal final class PickerViewDelegate: NSObject, PickerViewDelegateProtocol {
	private let pickerViewType: PickerViewType
	private weak var dataSource: PickerViewDataSourceProtocol?
    private weak var callback: PickerViewDelegateCallbackProtocol?
	private let defaultColumnWidth: CGFloat
	private let defaultRowHeight: CGFloat
    
    // TODO: redundancy: picker view type and data source have components
	init(pickerViewType: PickerViewType, dataSource: PickerViewDataSourceProtocol, callback: PickerViewDelegateCallbackProtocol? = nil, defaultColumnWidth: CGFloat, defaultRowHeight: CGFloat) {
		self.pickerViewType = pickerViewType
		self.dataSource = dataSource
        self.callback = callback
		self.defaultColumnWidth = defaultColumnWidth
		self.defaultRowHeight = defaultRowHeight
    }
	
	func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
		guard let components = dataSource?.components else {
			return defaultColumnWidth
		}
		
		guard component >= 0, component < components.count else {
			return defaultColumnWidth
		}
		
		guard let widthForComponent = components[component].columnWidth else {
			return defaultColumnWidth
		}
		
		return widthForComponent
	}
	
	func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
		guard let components = dataSource?.components else {
			return defaultRowHeight
		}
		
		guard component >= 0, component < components.count else {
			return defaultRowHeight
		}
		
		guard let rowHeightForComponent = components[component].rowHeight else {
			return defaultRowHeight
		}
		
		return rowHeightForComponent
	}
	
	func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
		if let components = dataSource?.components, validate(component: component, row: row) {
			let pickerViewRow = components[component].rows[row]
			return pickerViewRow.getView()
		} else if let previousView = view {
			return previousView
		} else {
			return UIView()
		}
	}
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let components = dataSource?.components else {
            return
        }
        
        if validate(component: component, row: row) {
			let numberOfComponents = pickerView.numberOfComponents
			var selectedRowModels: [PickerViewRowModelProtocol] = []
			if numberOfComponents > 0 {
				for componentIndex in (0...numberOfComponents-1) {
					let selectedRowIndex = pickerView.selectedRow(inComponent: componentIndex)
					let row = components[componentIndex].rows[selectedRowIndex]
					if let rowModel = row.model {
						selectedRowModels.append(rowModel)
					}
				}
			}
			let rowModels: [PickerViewRowModelProtocol]? = selectedRowModels.isEmpty ? nil : selectedRowModels
            let currentRowModel = components[component].rows[row]
			callback?.didSelectRow(self, in: pickerView, ofType: pickerViewType, row: currentRowModel, rowModels: rowModels)
        } else {
            return
        }
    }
}

extension PickerViewDelegate {
    private func validate(component: Int, row: Int) -> Bool {
        guard let components = dataSource?.components else {
            return false
        }
        
        guard component >= 0, component < components.count else {
            return false
        }
        
        guard row >= 0, row < components[component].rows.count else {
            return false
        }
        
        return true
    }
}
