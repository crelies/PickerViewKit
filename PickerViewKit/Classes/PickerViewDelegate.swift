//
//  PickerViewDelegate.swift
//  PickerViewKit
//
//  Created by crelies on 14.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import UIKit

public protocol PickerViewDelegateProtocol: class, UIPickerViewDelegate {
    weak var dataSource: PickerViewDataSourceProtocol? { get }
    weak var callback: PickerViewDelegateCallbackProtocol? { get }
    
	init(dataSource: PickerViewDataSourceProtocol, callback: PickerViewDelegateCallbackProtocol?, defaultColumnWidth: CGFloat, defaultRowHeight: CGFloat)
}

public final class PickerViewDelegate: NSObject, PickerViewDelegateProtocol {
    public weak var dataSource: PickerViewDataSourceProtocol?
    public weak var callback: PickerViewDelegateCallbackProtocol?
	private let defaultColumnWidth: CGFloat
	private let defaultRowHeight: CGFloat
    
    public init(dataSource: PickerViewDataSourceProtocol, callback: PickerViewDelegateCallbackProtocol?, defaultColumnWidth: CGFloat, defaultRowHeight: CGFloat) {
        self.dataSource = dataSource
        self.callback = callback
		self.defaultColumnWidth = defaultColumnWidth
		self.defaultRowHeight = defaultRowHeight
    }
	
	public func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
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
	
	public func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
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
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let components = dataSource?.components else {
            return nil
        }
        
        if validate(component: component, row: row) {
            return components[component].rows[row].title
        } else {
            return nil
        }
    }
    
    public func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        guard let components = dataSource?.components else {
            return nil
        }
        
        if validate(component: component, row: row) {
            return components[component].rows[row].attributedTitle
        } else {
            return nil
        }
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let components = dataSource?.components else {
            return
        }
        
        if validate(component: component, row: row) {
            let rowModel = components[component].rows[row]
            callback?.didSelectRow(self, in: pickerView, row: rowModel)
        } else {
            return
        }
    }
}

extension PickerViewDelegate {
    fileprivate func validate(component: Int, row: Int) -> Bool {
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
