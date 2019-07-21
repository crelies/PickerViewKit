//
//  InternalPickerViewDelegateTests.swift
//  PickerViewKit_Tests
//
//  Created by crelies on 18.03.18.
//  Copyright © 2018 Christian Elies. All rights reserved.
//

@testable import PickerViewKit

import Foundation
import Nimble
import Quick

final class InternalPickerViewDelegateTests: QuickSpec {
    override func spec() {
        describe("InternalPickerViewDelegate") {
            let model = ""
            
            context("when initializing with data source and row height") {
                it("should return width for column") {
                    let label = UILabel()
                    let view: () -> UIView = {
                        return label
                    }
                    let row = PickerViewRow(type: .custom(view: view), model: model)
                    let column = PickerViewColumn(rows: [row])
                    let dataSource = PickerViewDataSource(columns: [column])
                    let delegate = InternalPickerViewDelegate(dataSource: dataSource, rowHeight: 84)
                    
                    expect(delegate.pickerView(UIPickerView(), widthForComponent: 0)) == Constants.defaultColumnWidth
                }
                
                it("should return view for row in column") {
                    let label = UILabel()
                    let view: () -> UIView = {
                        return label
                    }
                    let row = PickerViewRow(type: .custom(view: view), model: model)
                    let column = PickerViewColumn(rows: [row])
                    let dataSource = PickerViewDataSource(columns: [column])
                    let delegate = InternalPickerViewDelegate(dataSource: dataSource, rowHeight: 84)
                    
                    let rowView = delegate.pickerView(UIPickerView(), viewForRow: 0, forComponent: 0, reusing: nil) as? UILabel
                    expect(rowView) == label
                }
            }
            
            context("when initializing with data source, delegate and row height") {
                it("should return width for column") {
                    let label = UILabel()
                    let view: () -> UIView = {
                        return label
                    }
                    let row = PickerViewRow(type: .custom(view: view), model: model)
                    let column = PickerViewColumn(rows: [row])
                    let dataSource = PickerViewDataSource(columns: [column])
                    let delegate = MockPickerViewDelegate()
                    let internalDelegate = InternalPickerViewDelegate(dataSource: dataSource, delegate: delegate, rowHeight: 56)
                    
                    expect(internalDelegate.pickerView(UIPickerView(), widthForComponent: 0)) == Constants.defaultColumnWidth
                }
                
                it("should return view for row in column") {
                    let label = UILabel()
                    let view: () -> UIView = {
                        return label
                    }
                    let row = PickerViewRow(type: .custom(view: view), model: model)
                    let column = PickerViewColumn(rows: [row])
                    let dataSource = PickerViewDataSource(columns: [column])
                    let delegate = MockPickerViewDelegate()
                    let internalDelegate = InternalPickerViewDelegate(dataSource: dataSource, delegate: delegate, rowHeight: 56)
                    
                    let rowView = internalDelegate.pickerView(UIPickerView(), viewForRow: 0, forComponent: 0, reusing: nil) as? UILabel
                    expect(rowView) == label
                }
            }
            
            context("when did select row is called for row 0 in column 0") {
                let pickerView = UIPickerView()
                
                let model = MockPickerViewRowModel(name: "Mock Model")
                let row = PickerViewRow(type: .plain(title: "Mock"), model: model)
                let column = PickerViewColumn(rows: [row])
                
                it("should pass picker view to delegate") {
                    let dataSource = PickerViewDataSource(columns: [column])
                    pickerView.dataSource = dataSource
                    
                    let delegate = MockPickerViewDelegate()
                    let internalDelegate = InternalPickerViewDelegate(dataSource: dataSource, delegate: delegate, rowHeight: 84)
                    pickerView.delegate = internalDelegate
                    
                    internalDelegate.pickerView(pickerView, didSelectRow: 0, inComponent: 0)
                    
                    expect(delegate.pickerView) == pickerView
                }
                
                it("should pass row to delegate") {
                    let dataSource = PickerViewDataSource(columns: [column])
                    pickerView.dataSource = dataSource
                    
                    let delegate = MockPickerViewDelegate()
                    let internalDelegate = InternalPickerViewDelegate(dataSource: dataSource, delegate: delegate, rowHeight: 84)
                    pickerView.delegate = internalDelegate
                    
                    internalDelegate.pickerView(pickerView, didSelectRow: 0, inComponent: 0)
                    
                    expect(delegate.row) == row
                }
                
                it("should pass selected row models to delegate") {
                    let dataSource = PickerViewDataSource(columns: [column])
                    pickerView.dataSource = dataSource
                    
                    let delegate = MockPickerViewDelegate()
                    let internalDelegate = InternalPickerViewDelegate(dataSource: dataSource, delegate: delegate, rowHeight: 84)
                    pickerView.delegate = internalDelegate
                    
                    internalDelegate.pickerView(pickerView, didSelectRow: 0, inComponent: 0)
                    
                    expect(delegate.allSelectedRows.count) == 1
                }
            }
        }
    }
}
