//
//  PickerViewComponentTests.swift
//  PickerViewKit_Tests
//
//  Created by crelies on 18.03.18.
//  Copyright © 2018 Christian Elies. All rights reserved.
//

@testable import PickerViewKit

import Foundation
import Nimble
import Quick

final class PickerViewComponentTests: QuickSpec {
    override func spec() {
        describe("PickerViewComponent") {
            context("when initializing with zero rows") {
                let component = PickerViewComponent(rows: [])
                
                it("should return no rows") {
                    expect(component.rows.count) == 0
                }
                
                it("should return no columnWidth") {
                    expect(component.columnWidth).to(beNil())
                }
                
                it("should return no rowHeight") {
                    expect(component.rowHeight).to(beNil())
                }
            }
            
            context("when initializing with 1 row") {
                let row = PickerViewRow(type: .plain(title: "Mock"))
                let component = PickerViewComponent(rows: [row])
                
                it("should return the rows") {
                    expect(component.rows.count) == 1
                }
                
                it("should return no columnWidth") {
                    expect(component.columnWidth).to(beNil())
                }
                
                it("should return no rowHeight") {
                    expect(component.rowHeight).to(beNil())
                }
            }
            
            context("when initializing with zero rows, columnWidth and row height") {
                let component = PickerViewComponent(rows: [], columnWidth: 64, rowHeight: 56)
                
                it("should return zero rows") {
                    expect(component.rows.count) == 0
                }
                
                it("should return the columnWidth") {
                    expect(component.columnWidth) == 64
                }
                
                it("should return the rowHeight") {
                    expect(component.rowHeight) == 56
                }
            }
            
            context("when initializing with 1 row, columnWidth and row height") {
                let row = PickerViewRow(type: .plain(title: "Mock"))
                let component = PickerViewComponent(rows: [row], columnWidth: 64, rowHeight: 56)
                
                it("should return the rows") {
                    expect(component.rows.count) == 1
                }
                
                it("should return the columnWidth") {
                    expect(component.columnWidth) == 64
                }
                
                it("should return the rowHeight") {
                    expect(component.rowHeight) == 56
                }
            }
            
            context("when initializing with zero rows and columnWidth") {
                let component = PickerViewComponent(rows: [], columnWidth: 64)
                
                it("should return no rows") {
                    expect(component.rows.count) == 0
                }
                
                it("should return the columnWidth") {
                    expect(component.columnWidth) == 64
                }
            }
            
            context("when initializing with 1 row and columnWidth") {
                let row = PickerViewRow(type: .plain(title: "Mock"))
                let component = PickerViewComponent(rows: [row], columnWidth: 64)
                
                it("should return the rows") {
                    expect(component.rows.count) == 1
                }
                
                it("should return the columnWidth") {
                    expect(component.columnWidth) == 64
                }
            }
            
            context("when initializing with zero rows and rowHeight") {
                let component = PickerViewComponent(rows: [], rowHeight: 56)
                
                it("should return no rows") {
                    expect(component.rows.count) == 0
                }
                
                it("should return the rowHeight") {
                    expect(component.rowHeight) == 56
                }
            }
            
            context("when initializing with 1 row and rowHeight") {
                let row = PickerViewRow(type: .plain(title: "Mock"))
                let component = PickerViewComponent(rows: [row], rowHeight: 56)
                
                it("should return the rows") {
                    expect(component.rows.count) == 1
                }
                
                it("should return the rowHeight") {
                    expect(component.rowHeight) == 56
                }
            }
        }
    }
}
