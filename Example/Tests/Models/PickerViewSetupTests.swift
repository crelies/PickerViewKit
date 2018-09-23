//
//  PickerViewSetupTests.swift
//  PickerViewKit_Tests
//
//  Created by crelies on 18.03.18.
//  Copyright © 2018 Christian Elies. All rights reserved.
//

@testable import PickerViewKit

import Foundation
import Nimble
import Quick

final class PickerViewSetupTests: QuickSpec {
    override func spec() {
        describe("PickerViewSetup") {
            context("when initializing with picker view and type") {
                let pickerView = UIPickerView()
                let row = PickerViewRow(type: .plain(title: "Mock"))
                let column = PickerViewColumn(rows: [row])
                let setup = PickerViewSetup(pickerView: pickerView, columns: [column])
                
                it("should have picker view") {
                    expect(setup.pickerView) == pickerView
                }
                
                it("should have columns") {
                    expect(setup.columns.count) == 1
                }
                
                it("should have no delegate") {
                    expect(setup.delegate).to(beNil())
                }
                
                it("should have default column width") {
                    expect(setup.defaultColumnWidth) == 48
                }
                
                it("should have default row height") {
                    expect(setup.defaultRowHeight) == 48
                }
            }
            
            context("when initializing with picker view, type and callback") {
                let pickerView = UIPickerView()
                let row = PickerViewRow(type: .plain(title: "Mock"))
                let column = PickerViewColumn(rows: [row])
                var setup = PickerViewSetup(pickerView: pickerView, columns: [column])
                
                it("should have picker view") {
                    expect(setup.pickerView) == pickerView
                }
                
                it("should have columns") {
                    expect(setup.columns.count) == 1
                }
                
                it("should have delegate") {
                    let callback = MockPickerViewDelegateCallback()
                    setup.delegate = callback
                    expect(setup.delegate).toNot(beNil())
                }
                
                it("should have default column width") {
                    expect(setup.defaultColumnWidth) == 48
                }
                
                it("should have default row height") {
                    expect(setup.defaultRowHeight) == 48
                }
            }
            
            context("when initializing with picker view, type, callback and defaultColumnWidth") {
                let pickerView = UIPickerView()
                let row = PickerViewRow(type: .plain(title: "Mock"))
                let column = PickerViewColumn(rows: [row])
                var setup = PickerViewSetup(pickerView: pickerView, columns: [column], defaultColumnWidth: 96)
                
                it("should have picker view") {
                    expect(setup.pickerView) == pickerView
                }
                
                it("should have columns") {
                    expect(setup.columns.count) == 1
                }
                
                it("should have delegate") {
                    let callback = MockPickerViewDelegateCallback()
                    setup.delegate = callback
                    expect(setup.delegate).toNot(beNil())
                }
                
                it("should have custom default column width") {
                    expect(setup.defaultColumnWidth) == 96
                }
                
                it("should have default row height") {
                    expect(setup.defaultRowHeight) == 48
                }
            }
            
            context("when initializing with picker view, type, callback, defaultColumnWidth and defaultRowHeight") {
                let pickerView = UIPickerView()
                let row = PickerViewRow(type: .plain(title: "Mock"))
                let column = PickerViewColumn(rows: [row])
                var setup = PickerViewSetup(pickerView: pickerView, columns: [column], defaultColumnWidth: 128, defaultRowHeight: 56)
                
                it("should have picker view") {
                    expect(setup.pickerView) == pickerView
                }
                
                it("should have columns") {
                    expect(setup.columns.count) == 1
                }
                
                it("should have delegate") {
                    let callback = MockPickerViewDelegateCallback()
                    setup.delegate = callback
                    expect(setup.delegate).toNot(beNil())
                }
                
                it("should have custom default column width") {
                    expect(setup.defaultColumnWidth) == 128
                }
                
                it("should have custom default row height") {
                    expect(setup.defaultRowHeight) == 56
                }
            }
        }
    }
}
