//
//  PickerViewConfigurationTests.swift
//  PickerViewKit_Tests
//
//  Created by crelies on 18.03.18.
//  Copyright © 2018 Christian Elies. All rights reserved.
//

@testable import PickerViewKit

import Foundation
import Nimble
import Quick

final class PickerViewConfigurationTests: QuickSpec {
    override func spec() {
        describe("PickerViewConfiguration") {
            let model = ""
            
            context("when initializing with picker view and type") {
                let pickerView = UIPickerView()
                let row = PickerViewRow(type: .plain(title: "Mock"), model: model)
                let column = PickerViewColumn(rows: [row])
                let setup = PickerViewConfiguration(pickerView: pickerView, columns: [column], delegate: nil)
                
                it("should have picker view") {
                    expect(setup.pickerView) == pickerView
                }
                
                it("should have columns") {
                    expect(setup.columns.count) == 1
                }
                
                it("should have no delegate") {
                    expect(setup.delegate).to(beNil())
                }
                
                it("should have row height") {
                    expect(setup.rowHeight) == 48
                }
            }
            
            context("when initializing with picker view, type and delegate") {
                let pickerView = UIPickerView()
                let row = PickerViewRow(type: .plain(title: "Mock"), model: model)
                let column = PickerViewColumn(rows: [row])
                var setup = PickerViewConfiguration(pickerView: pickerView, columns: [column], delegate: nil)
                
                it("should have picker view") {
                    expect(setup.pickerView) == pickerView
                }
                
                it("should have columns") {
                    expect(setup.columns.count) == 1
                }
                
                it("should have delegate") {
                    let callback = MockPickerViewDelegate()
                    setup.delegate = callback
                    expect(setup.delegate).toNot(beNil())
                }
                
                it("should have row height") {
                    expect(setup.rowHeight) == 48
                }
            }
            
            context("when initializing with picker view, type and delegate") {
                let pickerView = UIPickerView()
                let row = PickerViewRow(type: .plain(title: "Mock"), model: model)
                let column = PickerViewColumn(rows: [row])
                var setup = PickerViewConfiguration(pickerView: pickerView, columns: [column], delegate: nil)
                
                it("should have picker view") {
                    expect(setup.pickerView) == pickerView
                }
                
                it("should have columns") {
                    expect(setup.columns.count) == 1
                }
                
                it("should have delegate") {
                    let callback = MockPickerViewDelegate()
                    setup.delegate = callback
                    expect(setup.delegate).toNot(beNil())
                }
                
                it("should have row height") {
                    expect(setup.rowHeight) == 48
                }
            }
            
            context("when initializing with picker view, type, delegate and defaultRowHeight") {
                let pickerView = UIPickerView()
                let row = PickerViewRow(type: .plain(title: "Mock"), model: model)
                let column = PickerViewColumn(rows: [row])
                var setup = PickerViewConfiguration(pickerView: pickerView, columns: [column], delegate: nil, rowHeight: 56)
                
                it("should have picker view") {
                    expect(setup.pickerView) == pickerView
                }
                
                it("should have columns") {
                    expect(setup.columns.count) == 1
                }
                
                it("should have delegate") {
                    let callback = MockPickerViewDelegate()
                    setup.delegate = callback
                    expect(setup.delegate).toNot(beNil())
                }
                
                it("should have custom row height") {
                    expect(setup.rowHeight) == 56
                }
            }
        }
    }
}
