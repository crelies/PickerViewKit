//
//  PickerViewDelegateTests.swift
//  PickerViewKit_Tests
//
//  Created by crelies on 18.03.18.
//  Copyright © 2018 Christian Elies. All rights reserved.
//

@testable import PickerViewKit

import Foundation
import Nimble
import Quick

final class PickerViewDelegateTests: QuickSpec {
    override func spec() {
        describe("PickerViewDelegate") {
            context("when initializing with data source, default column width and default row height") {
                it("should return width for component") {
                    let label = UILabel()
                    let view: () -> UIView = {
                        return label
                    }
                    let row = PickerViewRow(type: .custom(view: view))
                    let component = PickerViewComponent(rows: [row])
                    let dataSource = PickerViewDataSource(components: [component])
                    let delegate = PickerViewDelegate(dataSource: dataSource, defaultColumnWidth: 56, defaultRowHeight: 84)
                    
                    expect(delegate.pickerView(UIPickerView(), widthForComponent: 0)) == 56
                }
                
                it("should return row height for component") {
                    let label = UILabel()
                    let view: () -> UIView = {
                        return label
                    }
                    let row = PickerViewRow(type: .custom(view: view))
                    let component = PickerViewComponent(rows: [row])
                    let dataSource = PickerViewDataSource(components: [component])
                    let delegate = PickerViewDelegate(dataSource: dataSource, defaultColumnWidth: 56, defaultRowHeight: 84)
                    
                    expect(delegate.pickerView(UIPickerView(), rowHeightForComponent: 0)) == 84
                }
                
                it("should return view for row in component") {
                    let label = UILabel()
                    let view: () -> UIView = {
                        return label
                    }
                    let row = PickerViewRow(type: .custom(view: view))
                    let component = PickerViewComponent(rows: [row])
                    let dataSource = PickerViewDataSource(components: [component])
                    let delegate = PickerViewDelegate(dataSource: dataSource, defaultColumnWidth: 56, defaultRowHeight: 84)
                    
                    let rowView = delegate.pickerView(UIPickerView(), viewForRow: 0, forComponent: 0, reusing: nil) as? UILabel
                    expect(rowView) == label
                }
            }
            
            context("when initializing with data source, callback, default column width and default row height") {
                it("should return width for component") {
                    let label = UILabel()
                    let view: () -> UIView = {
                        return label
                    }
                    let row = PickerViewRow(type: .custom(view: view))
                    let component = PickerViewComponent(rows: [row])
                    let dataSource = PickerViewDataSource(components: [component])
                    let callback = MockPickerViewDelegateCallback()
                    let delegate = PickerViewDelegate(dataSource: dataSource, callback: callback, defaultColumnWidth: 64, defaultRowHeight: 56)
                    
                    expect(delegate.pickerView(UIPickerView(), widthForComponent: 0)) == 64
                }
                
                it("should return row height for component") {
                    let label = UILabel()
                    let view: () -> UIView = {
                        return label
                    }
                    let row = PickerViewRow(type: .custom(view: view))
                    let component = PickerViewComponent(rows: [row])
                    let dataSource = PickerViewDataSource(components: [component])
                    let callback = MockPickerViewDelegateCallback()
                    let delegate = PickerViewDelegate(dataSource: dataSource, callback: callback, defaultColumnWidth: 64, defaultRowHeight: 56)
                    
                    expect(delegate.pickerView(UIPickerView(), rowHeightForComponent: 0)) == 56
                }
                
                it("should return view for row in component") {
                    let label = UILabel()
                    let view: () -> UIView = {
                        return label
                    }
                    let row = PickerViewRow(type: .custom(view: view))
                    let component = PickerViewComponent(rows: [row])
                    let dataSource = PickerViewDataSource(components: [component])
                    let callback = MockPickerViewDelegateCallback()
                    let delegate = PickerViewDelegate(dataSource: dataSource, callback: callback, defaultColumnWidth: 64, defaultRowHeight: 56)
                    
                    let rowView = delegate.pickerView(UIPickerView(), viewForRow: 0, forComponent: 0, reusing: nil) as? UILabel
                    expect(rowView) == label
                }
            }
            
            context("when did select row is called for row 0 in component 0") {
                let pickerView = UIPickerView()
                
                let model = MockPickerViewRowModel(name: "Mock Model")
                let row = PickerViewRow(type: .plain(title: "Mock"), model: model)
                let component = PickerViewComponent(rows: [row])
                
                it("should pass delegate to callback") {
                    let dataSource = PickerViewDataSource(components: [component])
                    pickerView.dataSource = dataSource
                    
                    let callback = MockPickerViewDelegateCallback()
                    let delegate = PickerViewDelegate(dataSource: dataSource, callback: callback, defaultColumnWidth: 32, defaultRowHeight: 84)
                    pickerView.delegate = delegate
                    
                    delegate.pickerView(pickerView, didSelectRow: 0, inComponent: 0)
                    
                    let callbackDelegate = callback.delegate as? PickerViewDelegate
                    expect(callbackDelegate) == delegate
                }
                
                it("should pass picker view to callback") {
                    let dataSource = PickerViewDataSource(components: [component])
                    pickerView.dataSource = dataSource
                    
                    let callback = MockPickerViewDelegateCallback()
                    let delegate = PickerViewDelegate(dataSource: dataSource, callback: callback, defaultColumnWidth: 32, defaultRowHeight: 84)
                    pickerView.delegate = delegate
                    
                    delegate.pickerView(pickerView, didSelectRow: 0, inComponent: 0)
                    
                    expect(callback.pickerView) == pickerView
                }
                
                it("should pass row to callback") {
                    let dataSource = PickerViewDataSource(components: [component])
                    pickerView.dataSource = dataSource
                    
                    let callback = MockPickerViewDelegateCallback()
                    let delegate = PickerViewDelegate(dataSource: dataSource, callback: callback, defaultColumnWidth: 32, defaultRowHeight: 84)
                    pickerView.delegate = delegate
                    
                    delegate.pickerView(pickerView, didSelectRow: 0, inComponent: 0)
                    
                    let callbackRow = callback.row as? PickerViewRow
                    expect(callbackRow) == row
                }
                
                it("should pass row models to callback") {
                    let dataSource = PickerViewDataSource(components: [component])
                    pickerView.dataSource = dataSource
                    
                    let callback = MockPickerViewDelegateCallback()
                    let delegate = PickerViewDelegate(dataSource: dataSource, callback: callback, defaultColumnWidth: 32, defaultRowHeight: 84)
                    pickerView.delegate = delegate
                    
                    delegate.pickerView(pickerView, didSelectRow: 0, inComponent: 0)
                    
                    expect(callback.rowModels?.count) == 1
                }
            }
        }
    }
}
