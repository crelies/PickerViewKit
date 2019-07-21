//
//  PickerViewColumnTests.swift
//  PickerViewKit_Tests
//
//  Created by crelies on 18.03.18.
//  Copyright © 2018 Christian Elies. All rights reserved.
//

@testable import PickerViewKit

import Foundation
import Nimble
import Quick

final class PickerViewColumnTests: QuickSpec {
    override func spec() {
        describe("PickerViewColumn") {
            let model = ""
            
            context("when initializing with zero rows") {
                let column = PickerViewColumn(rows: [])
                
                it("should have no rows") {
                    expect(column.rows.count) == 0
                }
                
                it("should have default columnWidth") {
                    expect(column.columnWidth) == Constants.defaultColumnWidth
                }
            }
            
            context("when initializing with 1 row") {
                let row = PickerViewRow(type: .plain(title: "Mock"), model: model)
                let column = PickerViewColumn(rows: [row])
                
                it("should have rows") {
                    expect(column.rows.count) == 1
                }
                
                it("should have default columnWidth") {
                    expect(column.columnWidth) == Constants.defaultColumnWidth
                }
            }
            
            context("when initializing with zero rows and columnWidth") {
                let column = PickerViewColumn(rows: [], columnWidth: 64)
                
                it("should have no rows") {
                    expect(column.rows.count) == 0
                }
                
                it("should have the columnWidth") {
                    expect(column.columnWidth) == 64
                }
            }
            
            context("when initializing with 1 row and columnWidth") {
                let row = PickerViewRow(type: .plain(title: "Mock"), model: model)
                let column = PickerViewColumn(rows: [row], columnWidth: 64)
                
                it("should have rows") {
                    expect(column.rows.count) == 1
                }
                
                it("should have the columnWidth") {
                    expect(column.columnWidth) == 64
                }
            }
            
            context("when initializing with zero rows and columnWidth") {
                let column = PickerViewColumn(rows: [], columnWidth: 64)
                
                it("should have no rows") {
                    expect(column.rows.count) == 0
                }
                
                it("should have the columnWidth") {
                    expect(column.columnWidth) == 64
                }
            }
            
            context("when initializing with 1 row and columnWidth") {
                let row = PickerViewRow(type: .plain(title: "Mock"), model: model)
                let column = PickerViewColumn(rows: [row], columnWidth: 64)
                
                it("should have rows") {
                    expect(column.rows.count) == 1
                }
                
                it("should have the columnWidth") {
                    expect(column.columnWidth) == 64
                }
            }
            
            context("when initializing with zero rows") {
                let column = PickerViewColumn(rows: [])
                
                it("should have no rows") {
                    expect(column.rows.count) == 0
                }
            }
            
            context("when initializing with 1 row") {
                let row = PickerViewRow(type: .plain(title: "Mock"), model: model)
                let column = PickerViewColumn(rows: [row])
                
                it("should have rows") {
                    expect(column.rows.count) == 1
                }
            }
        }
    }
}
