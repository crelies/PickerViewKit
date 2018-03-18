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
                let component = PickerViewComponent(rows: [row])
                var setup: PickerViewSetup?
                do {
                    setup = try PickerViewSetup(pickerView: pickerView, type: .single(component: component))
                } catch {
                    fail("Could not create PickerViewSetup")
                }
                
                it("should have picker view") {
                    expect(setup?.pickerView) == pickerView
                }
                
                it("should have picker view type") {
                    expect(setup?.pickerViewType) == .single(component: component)
                }
                
                it("should have components") {
                    expect(setup?.components.count) == 1
                }
                
                it("should have no callback") {
                    expect(setup?.callback).to(beNil())
                }
                
                it("should have default column width") {
                    expect(setup?.defaultColumnWidth) == 48
                }
                
                it("should have default row height") {
                    expect(setup?.defaultRowHeight) == 48
                }
            }
            
            context("when initializing with picker view, type and callback") {
                let pickerView = UIPickerView()
                let row = PickerViewRow(type: .plain(title: "Mock"))
                let component = PickerViewComponent(rows: [row])
                var setup: PickerViewSetup?
                do {
                    setup = try PickerViewSetup(pickerView: pickerView, type: .single(component: component))
                } catch {
                    fail("Could not create PickerViewSetup")
                }
                
                it("should have picker view") {
                    expect(setup?.pickerView) == pickerView
                }
                
                it("should have picker view type") {
                    expect(setup?.pickerViewType) == .single(component: component)
                }
                
                it("should have components") {
                    expect(setup?.components.count) == 1
                }
                
                it("should have callback") {
                    let callback = MockPickerViewDelegateCallback()
                    setup?.callback = callback
                    expect(setup?.callback).toNot(beNil())
                }
                
                it("should have default column width") {
                    expect(setup?.defaultColumnWidth) == 48
                }
                
                it("should have default row height") {
                    expect(setup?.defaultRowHeight) == 48
                }
            }
            
            context("when initializing with picker view, type, callback and defaultColumnWidth") {
                let pickerView = UIPickerView()
                let row = PickerViewRow(type: .plain(title: "Mock"))
                let component = PickerViewComponent(rows: [row])
                var setup: PickerViewSetup?
                do {
                    setup = try PickerViewSetup(pickerView: pickerView, type: .single(component: component), defaultColumnWidth: 96)
                } catch {
                    fail("Could not create PickerViewSetup")
                }
                
                it("should have picker view") {
                    expect(setup?.pickerView) == pickerView
                }
                
                it("should have picker view type") {
                    expect(setup?.pickerViewType) == .single(component: component)
                }
                
                it("should have components") {
                    expect(setup?.components.count) == 1
                }
                
                it("should have callback") {
                    let callback = MockPickerViewDelegateCallback()
                    setup?.callback = callback
                    expect(setup?.callback).toNot(beNil())
                }
                
                it("should have custom default column width") {
                    expect(setup?.defaultColumnWidth) == 96
                }
                
                it("should have default row height") {
                    expect(setup?.defaultRowHeight) == 48
                }
            }
            
            context("when initializing with picker view, type, callback, defaultColumnWidth and defaultRowHeight") {
                let pickerView = UIPickerView()
                let row = PickerViewRow(type: .plain(title: "Mock"))
                let component = PickerViewComponent(rows: [row])
                var setup: PickerViewSetup?
                do {
                    setup = try PickerViewSetup(pickerView: pickerView, type: .single(component: component), defaultColumnWidth: 128, defaultRowHeight: 56)
                } catch {
                    fail("Could not create PickerViewSetup")
                }
                
                it("should have picker view") {
                    expect(setup?.pickerView) == pickerView
                }
                
                it("should have picker view type") {
                    expect(setup?.pickerViewType) == .single(component: component)
                }
                
                it("should have components") {
                    expect(setup?.components.count) == 1
                }
                
                it("should have callback") {
                    let callback = MockPickerViewDelegateCallback()
                    setup?.callback = callback
                    expect(setup?.callback).toNot(beNil())
                }
                
                it("should have custom default column width") {
                    expect(setup?.defaultColumnWidth) == 128
                }
                
                it("should have custom default row height") {
                    expect(setup?.defaultRowHeight) == 56
                }
            }
        }
    }
}
