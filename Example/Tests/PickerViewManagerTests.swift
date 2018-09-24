//
//  PickerViewManagerTests.swift
//  PickerViewKit_Tests
//
//  Created by crelies on 18.03.18.
//  Copyright © 2018 Christian Elies. All rights reserved.
//

@testable import PickerViewKit

import Foundation
import Nimble
import Quick

final class PickerViewManagerTests: QuickSpec {
    override func spec() {
        describe("PickerViewManager") {
			context("when initializing with setup") {
				it("should be not nil") {
                    let column = PickerViewColumn(rows: [])
                    let setup = PickerViewSetup(pickerView: UIPickerView(), columns: [column])
                    let pickerViewManager = PickerViewManager(setup: setup)
                    expect(pickerViewManager).toNot(beNil())
				}
			}
            
            context("when asking for the selected row models after initializing with 1 column having 2 rows") {
                let row0 = PickerViewRow(type: .plain(title: "Mock0"))
                let row1 = PickerViewRow(type: .plain(title: "Mock1"))
                let column0 = PickerViewColumn(rows: [row0, row1])
                
                it("should return the correct number of selected row models") {
                    let pickerView = UIPickerView()
                    let setup = PickerViewSetup(pickerView: pickerView, columns: [column0])
                    let manager = PickerViewManager(setup: setup)
                    expect(manager.selectedRowModels?.count) == 1
                }
                
                it("should return the selected row models") {
                    let pickerView = UIPickerView()
                    let setup = PickerViewSetup(pickerView: pickerView, columns: [column0])
                    let manager = PickerViewManager(setup: setup)
                    let expectedSelectedRowModel = SimpleRowModel(name: "Mock0")
                    expect(manager.selectedRowModels?.first?.name) == expectedSelectedRowModel.name
                }
            }
            
            context("when selecting row 1 in column 1 if there are 2 columns with in each case 2 rows") {
                let pickerView = UIPickerView()
                let row0 = PickerViewRow(type: .plain(title: "Mock0"))
                let row1 = PickerViewRow(type: .plain(title: "Mock1"))
                let column0 = PickerViewColumn(rows: [row0, row1])
                let column1 = PickerViewColumn(rows: [row0, row1])
                let setup = PickerViewSetup(pickerView: pickerView, columns: [column0, column1])
                let manager = PickerViewManager(setup: setup)
                
                it("should select the row") {
                    manager.selectRow(inColumn: 1, row: 1, animated: true)
                    expect(pickerView.selectedRow(inComponent: 1)) == 1
                }
                
                it("should return the correct selected row models") {
                    let expectedSelectedRowModel = SimpleRowModel(name: "Mock1")
                    expect(manager.selectedRowModels?.last?.name) == expectedSelectedRowModel.name
                }
            }
            
            context("when selecting a row model in column 0 if there is 1 column with 2 rows") {
                let pickerView = UIPickerView()
                let row0 = PickerViewRow(type: .plain(title: "Mock0"))
                let row1 = PickerViewRow(type: .plain(title: "Mock1"))
                let column0 = PickerViewColumn(rows: [row0, row1])
                let setup = PickerViewSetup(pickerView: pickerView, columns: [column0])
                let manager = PickerViewManager(setup: setup)
                
                it("should select the related row") {
                    let simpleRowModel = SimpleRowModel(name: "Mock1")
                    manager.selectRowModel(inColumn: 0, model: simpleRowModel, animated: true)
                    expect(pickerView.selectedRow(inComponent: 0)) == 1
                }
                
                it("should return the correct selected row models") {
                    let expectedSelectedRowModel = SimpleRowModel(name: "Mock1")
                    expect(manager.selectedRowModels?.first?.name) == expectedSelectedRowModel.name
                }
            }
			
			context("when updating from zero to 1 column") {
				it("should have correct number of columns in data source") {
                    let pickerView = UIPickerView()
                    let column = PickerViewColumn(rows: [])
                    let setup = PickerViewSetup(pickerView: pickerView, columns: [])
                    let manager = PickerViewManager(setup: setup)
                    
                    manager.updateColumns(columns: [column])
                    expect(pickerView.dataSource?.numberOfComponents(in: pickerView)) == 1
				}
				
				it("should have selected row 0 in column") {
                    let pickerView = UIPickerView()
                    let column = PickerViewColumn(rows: [])
                    let setup = PickerViewSetup(pickerView: pickerView, columns: [])
                    let manager = PickerViewManager(setup: setup)
                    
                    manager.updateColumns(columns: [column])
                    expect(pickerView.selectedRow(inComponent: 0)) == 0
				}
			}
			
			context("when updating from 2 to 1 column") {
				it("should have correct number of columns in data source") {
                    let pickerView = UIPickerView()
                    let column1 = PickerViewColumn(rows: [])
                    let column2 = PickerViewColumn(rows: [])
                    let setup = PickerViewSetup(pickerView: pickerView, columns: [column1, column2])
                    let manager = PickerViewManager(setup: setup)
                    
                    manager.updateColumns(columns: [column1])
                    expect(pickerView.dataSource?.numberOfComponents(in: pickerView)) == 1
				}
				
				it("should have selected row 0 in column") {
                    let pickerView = UIPickerView()
                    let row = PickerViewRow(type: .plain(title: "Mock"))
                    let column1 = PickerViewColumn(rows: [row, row])
                    let column2 = PickerViewColumn(rows: [row, row])
                    let setup = PickerViewSetup(pickerView: pickerView, columns: [column1, column2])
                    let manager = PickerViewManager(setup: setup)
                    
                    pickerView.selectRow(1, inComponent: 0, animated: false)
                    manager.updateColumns(columns: [column1])
                    expect(pickerView.selectedRow(inComponent: 0)) == 0
				}
			}
			
			context("when updating from 1 to 1 column") {
				it("should have correct number of columns in data source") {
                    let pickerView = UIPickerView()
                    let column = PickerViewColumn(rows: [])
                    let setup = PickerViewSetup(pickerView: pickerView, columns: [column])
                    let manager = PickerViewManager(setup: setup)
                    
                    manager.updateColumns(columns: [column])
                    expect(pickerView.dataSource?.numberOfComponents(in: pickerView)) == 1
				}
				
				it("should have selected row 0 in column") {
                    let pickerView = UIPickerView()
                    let row = PickerViewRow(type: .plain(title: "Mock"))
                    let column = PickerViewColumn(rows: [row, row])
                    let setup = PickerViewSetup(pickerView: pickerView, columns: [column])
                    let manager = PickerViewManager(setup: setup)
                    
                    pickerView.selectRow(1, inComponent: 0, animated: false)
                    manager.updateColumns(columns: [column])
                    expect(pickerView.selectedRow(inComponent: 0)) == 0
				}
			}
			
			context("when updating with no columns") {
				it("should have correct number of columns in data source") {
                    let pickerView = UIPickerView()
                    let column = PickerViewColumn(rows: [])
                    let setup = PickerViewSetup(pickerView: pickerView, columns: [column])
                    let manager = PickerViewManager(setup: setup)
                    
                    expect(pickerView.dataSource?.numberOfComponents(in: pickerView)) == 1
                    manager.updateColumns(columns: [])
                    expect(pickerView.dataSource?.numberOfComponents(in: pickerView)) == 0
				}
			}
			
			context("when updating column at index -1") {
				it("should have correct number of columns in data source") {
                    let pickerView = UIPickerView()
                    let column = PickerViewColumn(rows: [])
                    let setup = PickerViewSetup(pickerView: pickerView, columns: [column])
                    let manager = PickerViewManager(setup: setup)
                    
                    manager.updateColumn(atIndex: -1, column: column)
                    expect(pickerView.dataSource?.numberOfComponents(in: pickerView)) == 1
				}
				
				it("should have correct number of rows in column in data source") {
                    let pickerView = UIPickerView()
                    var column = PickerViewColumn(rows: [])
                    let setup = PickerViewSetup(pickerView: pickerView, columns: [column])
                    let manager = PickerViewManager(setup: setup)
                    
                    let row = PickerViewRow(type: .plain(title: "Mock"))
                    column.rows.append(row)
                    
                    manager.updateColumn(atIndex: -1, column: column)
                    expect(pickerView.dataSource?.pickerView(pickerView, numberOfRowsInComponent: -1)) == 0
				}
			}
			
			context("when updating column at index 0") {
				it("should have correct number of columns in data source") {
                    let pickerView = UIPickerView()
                    let column = PickerViewColumn(rows: [])
                    let setup = PickerViewSetup(pickerView: pickerView, columns: [column])
                    let manager = PickerViewManager(setup: setup)
                    
                    manager.updateColumn(atIndex: 0, column: column)
                    expect(pickerView.dataSource?.numberOfComponents(in: pickerView)) == 1
				}
				
				it("should have correct number of rows in column in data source") {
                    let pickerView = UIPickerView()
                    var column = PickerViewColumn(rows: [])
                    let setup = PickerViewSetup(pickerView: pickerView, columns: [column])
                    let manager = PickerViewManager(setup: setup)
                    
                    let row = PickerViewRow(type: .plain(title: "Mock"))
                    column.rows.append(row)
                    
                    manager.updateColumn(atIndex: 0, column: column)
                    expect(pickerView.dataSource?.pickerView(pickerView, numberOfRowsInComponent: 0)) == 1
				}
			}
			
			context("when updating column with no rows") {
				it("should have correct number of columns in data source") {
                    let pickerView = UIPickerView()
                    let row = PickerViewRow(type: .plain(title: "Mock"))
                    let column = PickerViewColumn(rows: [row])
                    let setup = PickerViewSetup(pickerView: pickerView, columns: [column])
                    let manager = PickerViewManager(setup: setup)
                    
                    expect(pickerView.dataSource?.pickerView(pickerView, numberOfRowsInComponent: 0)) == 1
                    manager.updateRows(inColumn: 0, rows: [])
                    expect(pickerView.dataSource?.pickerView(pickerView, numberOfRowsInComponent: 0)) == 0
                }
			}
			
			context("when updating from zero to 1 row") {
				it("should have correct number of rows in column in data source") {
                    let pickerView = UIPickerView()
                    let column = PickerViewColumn(rows: [])
                    let setup = PickerViewSetup(pickerView: pickerView, columns: [column])
                    let manager = PickerViewManager(setup: setup)
                    
                    let row = PickerViewRow(type: .plain(title: "Mock"))
                    manager.updateRows(inColumn: 0, rows: [row])
                    expect(pickerView.dataSource?.pickerView(pickerView, numberOfRowsInComponent: 0)) == 1
				}
				
				it("should have selected row 0 in updating column") {
                    let pickerView = UIPickerView()
                    let column = PickerViewColumn(rows: [])
                    let setup = PickerViewSetup(pickerView: pickerView, columns: [column])
                    let manager = PickerViewManager(setup: setup)
                    
                    let row = PickerViewRow(type: .plain(title: "Mock"))
                    manager.updateRows(inColumn: 0, rows: [row])
                    expect(pickerView.selectedRow(inComponent: 0)) == 0
				}
			}
			
			context("when updating from 2 to 1 row") {
				it("should have correct number of rows in column in data source") {
                    let pickerView = UIPickerView()
                    let row = PickerViewRow(type: .plain(title: "Mock"))
                    let column = PickerViewColumn(rows: [row, row])
                    let setup = PickerViewSetup(pickerView: pickerView, columns: [column])
                    let manager = PickerViewManager(setup: setup)
                    
                    manager.updateRows(inColumn: 0, rows: [row])
                    expect(pickerView.dataSource?.pickerView(pickerView, numberOfRowsInComponent: 0)) == 1
				}
				
				it("should have selected row 0 in updating column") {
                    let pickerView = UIPickerView()
                    let row = PickerViewRow(type: .plain(title: "Mock"))
                    let column = PickerViewColumn(rows: [row, row])
                    let setup = PickerViewSetup(pickerView: pickerView, columns: [column])
                    let manager = PickerViewManager(setup: setup)
                    
                    pickerView.selectRow(1, inComponent: 0, animated: false)
                    manager.updateRows(inColumn: 0, rows: [row])
                    expect(pickerView.selectedRow(inComponent: 0)) == 0
				}
			}
			
			context("when updating from 2 to 2 rows") {
				it("should have correct number of rows in column in data source") {
                    let pickerView = UIPickerView()
                    let row = PickerViewRow(type: .plain(title: "Mock"))
                    let column = PickerViewColumn(rows: [row, row])
                    let setup = PickerViewSetup(pickerView: pickerView, columns: [column])
                    let manager = PickerViewManager(setup: setup)
                    
                    manager.updateRows(inColumn: 0, rows: [row, row])
                    expect(pickerView.dataSource?.pickerView(pickerView, numberOfRowsInComponent: 0)) == 2
				}
				
				it("should have selected row 0 in updating column") {
                    let pickerView = UIPickerView()
                    let row = PickerViewRow(type: .plain(title: "Mock"))
                    let column = PickerViewColumn(rows: [row, row])
                    let setup = PickerViewSetup(pickerView: pickerView, columns: [column])
                    let manager = PickerViewManager(setup: setup)
                    
                    pickerView.selectRow(1, inComponent: 0, animated: false)
                    manager.updateRows(inColumn: 0, rows: [row, row])
                    expect(pickerView.selectedRow(inComponent: 0)) == 0
				}
			}
			
			context("when updating rows in column -1") {
				it("should have correct number of rows in column in data source") {
                    let pickerView = UIPickerView()
                    let row = PickerViewRow(type: .plain(title: "Mock"))
                    let column = PickerViewColumn(rows: [row, row])
                    let setup = PickerViewSetup(pickerView: pickerView, columns: [column])
                    let manager = PickerViewManager(setup: setup)
                    
                    expect(pickerView.dataSource?.pickerView(pickerView, numberOfRowsInComponent: -1)) == 0
                    manager.updateRows(inColumn: -1, rows: [row, row])
                    expect(pickerView.dataSource?.pickerView(pickerView, numberOfRowsInComponent: -1)) == 0
				}
			}
        }
    }
}
