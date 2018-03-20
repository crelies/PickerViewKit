//
//  PickerViewDataSourceTests.swift
//  PickerViewKit_Tests
//
//  Created by crelies on 18.03.18.
//  Copyright © 2018 Christian Elies. All rights reserved.
//

@testable import PickerViewKit

import Foundation
import Nimble
import Quick

final class PickerViewDataSourceTests: QuickSpec {
    override func spec() {
        describe("PickerViewDataSource") {
            context("when initializing with no columns") {
                let dataSource = PickerViewDataSource(columns: [])
                
                it("should return the correct number of columns") {
                    expect(dataSource.numberOfComponents(in: UIPickerView())) == 0
                }
                
                it("should return the correct number of rows in column") {
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 0
                }
            }
            
            context("when initializing with 1 column having no rows") {
                let column = PickerViewColumn(rows: [])
                let dataSource = PickerViewDataSource(columns: [column])
                
                it("should return the correct number of columns") {
                    expect(dataSource.numberOfComponents(in: UIPickerView())) == 1
                }
                
                it("should return the correct number of rows in column") {
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 0
                }
            }
            
            context("when initializing with 1 column having 1 row") {
                let row = PickerViewRow(type: .plain(title: "Mock"))
                let column = PickerViewColumn(rows: [row])
                let dataSource = PickerViewDataSource(columns: [column])
                
                it("should return the correct number of columns") {
                    expect(dataSource.numberOfComponents(in: UIPickerView())) == 1
                }
                
                it("should return the correct number of rows in column") {
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 1
                }
            }
            
            context("when initializing with 2 columns having no rows") {
                let column1 = PickerViewColumn(rows: [])
                let column2 = PickerViewColumn(rows: [])
                let dataSource = PickerViewDataSource(columns: [column1, column2])
                
                it("should return the correct number of columns") {
                    expect(dataSource.numberOfComponents(in: UIPickerView())) == 2
                }
                
                it("should return the correct number of rows in column 1") {
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 0
                }
                
                it("should return the correct number of rows in column 2") {
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 1)) == 0
                }
            }
            
            context("when initializing with 2 columns having 1 row") {
                let row = PickerViewRow(type: .plain(title: "Mock"))
                let column1 = PickerViewColumn(rows: [row])
                let column2 = PickerViewColumn(rows: [row])
                let dataSource = PickerViewDataSource(columns: [column1, column2])
                
                it("should return the correct number of columns") {
                    expect(dataSource.numberOfComponents(in: UIPickerView())) == 2
                }
                
                it("should return the correct number of rows in column 1") {
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 1
                }
                
                it("should return the correct number of rows in column 2") {
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 1)) == 1
                }
            }
            
            context("when updating from zero to 1 column having no rows") {
                let dataSource = PickerViewDataSource(columns: [])
                let column = PickerViewColumn(rows: [])
                
                it("should return the correct number of columns") {
                    expect(dataSource.numberOfComponents(in: UIPickerView())) == 0
                    dataSource.updateColumns(columns: [column])
                    expect(dataSource.numberOfComponents(in: UIPickerView())) == 1
                }
                
                it("should return the correct number of rows in column") {
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 0
                    dataSource.updateColumns(columns: [column])
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 0
                }
            }
            
            context("when updating from zero to 1 column having 1 row") {
                let dataSource = PickerViewDataSource(columns: [])
                let row = PickerViewRow(type: .plain(title: "Mock"))
                let column = PickerViewColumn(rows: [])
                
                it("should return the correct number of columns") {
                    expect(dataSource.numberOfComponents(in: UIPickerView())) == 0
                    dataSource.updateColumns(columns: [column])
                    expect(dataSource.numberOfComponents(in: UIPickerView())) == 1
                }
                
                it("should return the correct number of rows in column") {
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 0
                    let column = PickerViewColumn(rows: [row])
                    dataSource.updateColumns(columns: [column])
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 1
                }
            }
            
            context("when updating from 2 to 1 column having no rows") {
                let column1 = PickerViewColumn(rows: [])
                let column2 = PickerViewColumn(rows: [])
                let dataSource = PickerViewDataSource(columns: [column1, column2])
                
                it("should return the correct number of columns") {
                    expect(dataSource.numberOfComponents(in: UIPickerView())) == 2
                    dataSource.updateColumns(columns: [column2])
                    expect(dataSource.numberOfComponents(in: UIPickerView())) == 1
                }
                
                it("should return the correct number of rows in column 1") {
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 0
                    dataSource.updateColumns(columns: [column1])
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 0
                }
                
                it("should return the correct number of rows in column 2") {
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 1)) == 0
                    dataSource.updateColumns(columns: [column1])
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 1)) == 0
                }
            }
            
            context("when updating from 2 to 1 column having 1 row") {
                let row = PickerViewRow(type: .plain(title: "Mock"))
                let column1 = PickerViewColumn(rows: [row])
                let column2 = PickerViewColumn(rows: [row])
                
                it("should return the correct number of columns") {
                    let dataSource = PickerViewDataSource(columns: [column1, column2])
                    expect(dataSource.numberOfComponents(in: UIPickerView())) == 2
                    dataSource.updateColumns(columns: [column2])
                    expect(dataSource.numberOfComponents(in: UIPickerView())) == 1
                }
                
                it("should return the correct number of rows in column 1") {
                    let dataSource = PickerViewDataSource(columns: [column1, column2])
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 1
                    dataSource.updateColumns(columns: [column1])
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 1
                }
                
                it("should return the correct number of rows in column 2") {
                    let dataSource = PickerViewDataSource(columns: [column1, column2])
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 1)) == 1
                    dataSource.updateColumns(columns: [column1])
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 1)) == 0
                }
            }
            
            context("when updating from 2 to 2 columns having no rows") {
                let column1 = PickerViewColumn(rows: [])
                let column2 = PickerViewColumn(rows: [])
                let dataSource = PickerViewDataSource(columns: [column1, column2])
                
                it("should return the correct number of columns") {
                    expect(dataSource.numberOfComponents(in: UIPickerView())) == 2
                    dataSource.updateColumns(columns: [column2, column1])
                    expect(dataSource.numberOfComponents(in: UIPickerView())) == 2
                }
                
                it("should return the correct number of rows in column 1") {
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 0
                    dataSource.updateColumns(columns: [column2, column1])
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 0
                }
                
                it("should return the correct number of rows in column 2") {
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 1)) == 0
                    dataSource.updateColumns(columns: [column2, column1])
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 1)) == 0
                }
            }
            
            context("when updating from 2 to 2 columns having 1 row") {
                let row = PickerViewRow(type: .plain(title: "Mock"))
                let column1 = PickerViewColumn(rows: [row])
                let column2 = PickerViewColumn(rows: [row])
                let dataSource = PickerViewDataSource(columns: [column1, column2])
                
                it("should return the correct number of columns") {
                    expect(dataSource.numberOfComponents(in: UIPickerView())) == 2
                    dataSource.updateColumns(columns: [column2, column1])
                    expect(dataSource.numberOfComponents(in: UIPickerView())) == 2
                }
                
                it("should return the correct number of rows in column 1") {
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 1
                    dataSource.updateColumns(columns: [column2, column1])
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 1
                }
                
                it("should return the correct number of rows in column 2") {
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 1)) == 1
                    dataSource.updateColumns(columns: [column2, column1])
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 1)) == 1
                }
            }
            
            context("when updating rows in column from zero to 1 row") {
                let row = PickerViewRow(type: .plain(title: "Mock"))
                let column = PickerViewColumn(rows: [])
                
                it("should return the correct number of rows in column") {
                    let dataSource = PickerViewDataSource(columns: [column])
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 0
                    dataSource.updateRows(inColumn: 0, rows: [row])
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 1
                }
            }
            
            context("when updating rows in column from 1 to zero rows") {
                let row = PickerViewRow(type: .plain(title: "Mock"))
                let column = PickerViewColumn(rows: [row])
                
                it("should return the correct number of rows in column") {
                    let dataSource = PickerViewDataSource(columns: [column])
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 1
                    dataSource.updateRows(inColumn: 0, rows: [])
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 0
                }
            }
            
            context("when updating rows in column from 1 to 1 row") {
                let row = PickerViewRow(type: .plain(title: "Mock"))
                let column = PickerViewColumn(rows: [row])
                
                it("should return the correct number of rows in column") {
                    let dataSource = PickerViewDataSource(columns: [column])
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 1
                    dataSource.updateRows(inColumn: 0, rows: [row])
                    expect(dataSource.pickerView(UIPickerView(), numberOfRowsInComponent: 0)) == 1
                }
            }
        }
    }
}
