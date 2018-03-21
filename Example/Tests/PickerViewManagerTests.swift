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
					do {
						let column = PickerViewColumn(rows: [])
						let setup = try PickerViewSetup(pickerView: UIPickerView(), type: .single(column: column))
						let pickerViewManager = PickerViewManager(setup: setup)
						expect(pickerViewManager).toNot(beNil())
					} catch {
						fail("Could not init PickerViewSetup")
					}
				}
			}
			
			context("when updating from zero to 1 column") {
				it("should have correct number of columns in data source") {
					do {
						let pickerView = UIPickerView()
						let column = PickerViewColumn(rows: [])
						let setup = try PickerViewSetup(pickerView: pickerView, type: .multi(columns: []))
						let manager = PickerViewManager(setup: setup)
						
						manager.updateColumns(columns: [column])
						expect(pickerView.dataSource?.numberOfComponents(in: pickerView)) == 1
					} catch {
						fail("Could not create PickerViewSetup")
					}
				}
				
				it("should have selected row 0 in column") {
					do {
						let pickerView = UIPickerView()
						let column = PickerViewColumn(rows: [])
						let setup = try PickerViewSetup(pickerView: pickerView, type: .multi(columns: []))
						let manager = PickerViewManager(setup: setup)
						
						manager.updateColumns(columns: [column])
						expect(pickerView.selectedRow(inComponent: 0)) == 0
					} catch {
						fail("Could not create PickerViewSetup")
					}
				}
			}
			
			context("when updating from 2 to 1 column") {
				it("should have correct number of columns in data source") {
					do {
						let pickerView = UIPickerView()
						let column1 = PickerViewColumn(rows: [])
						let column2 = PickerViewColumn(rows: [])
						let setup = try PickerViewSetup(pickerView: pickerView, type: .multi(columns: [column1, column2]))
						let manager = PickerViewManager(setup: setup)
						
						manager.updateColumns(columns: [column1])
						expect(pickerView.dataSource?.numberOfComponents(in: pickerView)) == 1
					} catch {
						fail("Could not create PickerViewSetup")
					}
				}
				
				it("should have selected row 0 in column") {
					do {
						let pickerView = UIPickerView()
						let row = PickerViewRow(type: .plain(title: "Mock"))
						let column1 = PickerViewColumn(rows: [row, row])
						let column2 = PickerViewColumn(rows: [row, row])
						let setup = try PickerViewSetup(pickerView: pickerView, type: .multi(columns: [column1, column2]))
						let manager = PickerViewManager(setup: setup)
						
						pickerView.selectRow(1, inComponent: 0, animated: false)
						manager.updateColumns(columns: [column1])
						expect(pickerView.selectedRow(inComponent: 0)) == 0
					} catch {
						fail("Could not create PickerViewSetup")
					}
				}
			}
			
			context("when updating from 1 to 1 column") {
				it("should have correct number of columns in data source") {
					do {
						let pickerView = UIPickerView()
						let column = PickerViewColumn(rows: [])
						let setup = try PickerViewSetup(pickerView: pickerView, type: .multi(columns: [column]))
						let manager = PickerViewManager(setup: setup)
						
						manager.updateColumns(columns: [column])
						expect(pickerView.dataSource?.numberOfComponents(in: pickerView)) == 1
					} catch {
						fail("Could not create PickerViewSetup")
					}
				}
				
				it("should have selected row 0 in column") {
					do {
						let pickerView = UIPickerView()
						let row = PickerViewRow(type: .plain(title: "Mock"))
						let column = PickerViewColumn(rows: [row, row])
						let setup = try PickerViewSetup(pickerView: pickerView, type: .multi(columns: [column]))
						let manager = PickerViewManager(setup: setup)
						
						pickerView.selectRow(1, inComponent: 0, animated: false)
						manager.updateColumns(columns: [column])
						expect(pickerView.selectedRow(inComponent: 0)) == 0
					} catch {
						fail("Could not create PickerViewSetup")
					}
				}
			}
			
			context("when updating with no columns") {
				it("should have correct number of columns in data source") {
					do {
						let pickerView = UIPickerView()
						let column = PickerViewColumn(rows: [])
						let setup = try PickerViewSetup(pickerView: pickerView, type: .multi(columns: [column]))
						let manager = PickerViewManager(setup: setup)
						
						expect(pickerView.dataSource?.numberOfComponents(in: pickerView)) == 1
						manager.updateColumns(columns: [])
						expect(pickerView.dataSource?.numberOfComponents(in: pickerView)) == 0
					} catch {
						fail("Could not create PickerViewSetup")
					}
				}
			}
			
			context("when updating column at index -1") {
				it("should have correct number of columns in data source") {
					do {
						let pickerView = UIPickerView()
						let column = PickerViewColumn(rows: [])
						let setup = try PickerViewSetup(pickerView: pickerView, type: .multi(columns: [column]))
						let manager = PickerViewManager(setup: setup)
						
						manager.updateColumn(atIndex: -1, column: column)
						expect(pickerView.dataSource?.numberOfComponents(in: pickerView)) == 0
					} catch {
						fail("Could not create PickerViewSetup")
					}
				}
				
				it("should have correct number of rows in column in data source") {
					do {
						let pickerView = UIPickerView()
						var column = PickerViewColumn(rows: [])
						let setup = try PickerViewSetup(pickerView: pickerView, type: .multi(columns: [column]))
						let manager = PickerViewManager(setup: setup)
						
						let row = PickerViewRow(type: .plain(title: "Mock"))
						column.rows.append(row)
						
						manager.updateColumn(atIndex: -1, column: column)
						expect(pickerView.dataSource?.pickerView(pickerView, numberOfRowsInComponent: -1)) == 0
					} catch {
						fail("Could not create PickerViewSetup")
					}
				}
			}
			
			context("when updating column at index 0") {
				it("should have correct number of columns in data source") {
					do {
						let pickerView = UIPickerView()
						let column = PickerViewColumn(rows: [])
						let setup = try PickerViewSetup(pickerView: pickerView, type: .multi(columns: [column]))
						let manager = PickerViewManager(setup: setup)
						
						manager.updateColumn(atIndex: 0, column: column)
						expect(pickerView.dataSource?.numberOfComponents(in: pickerView)) == 1
					} catch {
						fail("Could not create PickerViewSetup")
					}
				}
				
				it("should have correct number of rows in column in data source") {
					do {
						let pickerView = UIPickerView()
						var column = PickerViewColumn(rows: [])
						let setup = try PickerViewSetup(pickerView: pickerView, type: .multi(columns: [column]))
						let manager = PickerViewManager(setup: setup)
						
						let row = PickerViewRow(type: .plain(title: "Mock"))
						column.rows.append(row)
						
						manager.updateColumn(atIndex: 0, column: column)
						expect(pickerView.dataSource?.pickerView(pickerView, numberOfRowsInComponent: 0)) == 1
					} catch {
						fail("Could not create PickerViewSetup")
					}
				}
			}
			
			context("when updating column with no rows") {
				it("should have correct number of columns in data source") {
					do {
						let pickerView = UIPickerView()
						let row = PickerViewRow(type: .plain(title: "Mock"))
						let column = PickerViewColumn(rows: [row])
						let setup = try PickerViewSetup(pickerView: pickerView, type: .multi(columns: [column]))
						let manager = PickerViewManager(setup: setup)
						
						expect(pickerView.dataSource?.pickerView(pickerView, numberOfRowsInComponent: 0)) == 1
						manager.updateRows(inColumn: 0, rows: [])
						expect(pickerView.dataSource?.pickerView(pickerView, numberOfRowsInComponent: 0)) == 0
					} catch {
						fail("Could not create PickerViewSetup")
					}
				}
			}
			
			context("when updating from zero to 1 row") {
				it("should have correct number of rows in column in data source") {
					do {
						let pickerView = UIPickerView()
						let column = PickerViewColumn(rows: [])
						let setup = try PickerViewSetup(pickerView: pickerView, type: .multi(columns: [column]))
						let manager = PickerViewManager(setup: setup)
						
						let row = PickerViewRow(type: .plain(title: "Mock"))
						manager.updateRows(inColumn: 0, rows: [row])
						expect(pickerView.dataSource?.pickerView(pickerView, numberOfRowsInComponent: 0)) == 1
					} catch {
						fail("Could not create PickerViewSetup")
					}
				}
				
				it("should have selected row 0 in updating column") {
					do {
						let pickerView = UIPickerView()
						let column = PickerViewColumn(rows: [])
						let setup = try PickerViewSetup(pickerView: pickerView, type: .multi(columns: [column]))
						let manager = PickerViewManager(setup: setup)
						
						let row = PickerViewRow(type: .plain(title: "Mock"))
						manager.updateRows(inColumn: 0, rows: [row])
						expect(pickerView.selectedRow(inComponent: 0)) == 0
					} catch {
						fail("Could not create PickerViewSetup")
					}
				}
			}
			
			context("when updating from 2 to 1 row") {
				it("should have correct number of rows in column in data source") {
					do {
						let pickerView = UIPickerView()
						let row = PickerViewRow(type: .plain(title: "Mock"))
						let column = PickerViewColumn(rows: [row, row])
						let setup = try PickerViewSetup(pickerView: pickerView, type: .multi(columns: [column]))
						let manager = PickerViewManager(setup: setup)
						
						manager.updateRows(inColumn: 0, rows: [row])
						expect(pickerView.dataSource?.pickerView(pickerView, numberOfRowsInComponent: 0)) == 1
					} catch {
						fail("Could not create PickerViewSetup")
					}
				}
				
				it("should have selected row 0 in updating column") {
					do {
						let pickerView = UIPickerView()
						let row = PickerViewRow(type: .plain(title: "Mock"))
						let column = PickerViewColumn(rows: [row, row])
						let setup = try PickerViewSetup(pickerView: pickerView, type: .multi(columns: [column]))
						let manager = PickerViewManager(setup: setup)
						
						pickerView.selectRow(1, inComponent: 0, animated: false)
						manager.updateRows(inColumn: 0, rows: [row])
						expect(pickerView.selectedRow(inComponent: 0)) == 0
					} catch {
						fail("Could not create PickerViewSetup")
					}
				}
			}
			
			context("when updating from 2 to 2 rows") {
				it("should have correct number of rows in column in data source") {
					do {
						let pickerView = UIPickerView()
						let row = PickerViewRow(type: .plain(title: "Mock"))
						let column = PickerViewColumn(rows: [row, row])
						let setup = try PickerViewSetup(pickerView: pickerView, type: .multi(columns: [column]))
						let manager = PickerViewManager(setup: setup)
						
						manager.updateRows(inColumn: 0, rows: [row, row])
						expect(pickerView.dataSource?.pickerView(pickerView, numberOfRowsInComponent: 0)) == 2
					} catch {
						fail("Could not create PickerViewSetup")
					}
				}
				
				it("should have selected row 0 in updating column") {
					do {
						let pickerView = UIPickerView()
						let row = PickerViewRow(type: .plain(title: "Mock"))
						let column = PickerViewColumn(rows: [row, row])
						let setup = try PickerViewSetup(pickerView: pickerView, type: .multi(columns: [column]))
						let manager = PickerViewManager(setup: setup)
						
						pickerView.selectRow(1, inComponent: 0, animated: false)
						manager.updateRows(inColumn: 0, rows: [row, row])
						expect(pickerView.selectedRow(inComponent: 0)) == 0
					} catch {
						fail("Could not create PickerViewSetup")
					}
				}
			}
			
			context("when updating rows in column -1") {
				it("should have correct number of rows in column in data source") {
					do {
						let pickerView = UIPickerView()
						let row = PickerViewRow(type: .plain(title: "Mock"))
						let column = PickerViewColumn(rows: [row, row])
						let setup = try PickerViewSetup(pickerView: pickerView, type: .multi(columns: [column]))
						let manager = PickerViewManager(setup: setup)
						
						expect(pickerView.dataSource?.pickerView(pickerView, numberOfRowsInComponent: -1)) == 0
						manager.updateRows(inColumn: -1, rows: [row, row])
						expect(pickerView.dataSource?.pickerView(pickerView, numberOfRowsInComponent: -1)) == 0
					} catch {
						fail("Could not create PickerViewSetup")
					}
				}
			}
        }
    }
}
