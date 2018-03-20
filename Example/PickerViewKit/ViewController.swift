//
//  ViewController.swift
//  PickerViewKit_Example
//
//  Created by crelies on 14.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import Foundation
import PickerViewKit
import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var pickerView: UIPickerView!
	@IBOutlet weak var selectedRowModelsLabel: UILabel!
	
    private var manager: PickerViewManager?
	
	private let oneSeasonRowModel = SeasonRowModel(identifier: 6, name: "Season 6", description: "Awesome season")
	lazy private var oneSeasonRow: SeasonRow = {
		return SeasonRow(type: .plain(title: oneSeasonRowModel.name), model: oneSeasonRowModel)
	}()
	private let anotherSeasonRowModel = SeasonRowModel(identifier: 7, name: "Season 7", description: "Totally awesome season")
	lazy private var anotherSeasonRow: SeasonRow = {
		return SeasonRow(type: .plain(title: anotherSeasonRowModel.name), model: anotherSeasonRowModel)
	}()
	private let oneSeasonEpisodes: [EpisodeRow] = Array(1...10).map { number in
		let model = ValueRowModel(identifier: "\(number)", name: "\(number)", description: "Episode \(number)")
		var row = EpisodeRow(type: .plain(title: "\(number)"))
		row.model = model
		return row
	}
	private let anotherSeasonEpisodes: [EpisodeRow] = Array(1...7).map { number in
		let model = ValueRowModel(identifier: "\(number)", name: "\(number)", description: "Episode \(number)")
		var row = EpisodeRow(type: .plain(title: "\(number)"))
		row.model = model
		return row
	}
	
	private lazy var flagsRow: KeyRow = {
		let flagsRowModel = KeyRowModel(identifier: "flags", name: "Flags", description: "Country flags")
		let view: () -> UILabel = {
			let flagsLabel = UILabel()
			flagsLabel.textAlignment = .center
			flagsLabel.textColor = #colorLiteral(red: 0.6293302774, green: 0.741150558, blue: 0.814735353, alpha: 1)
			flagsLabel.text = flagsRowModel.name
			flagsLabel.backgroundColor = #colorLiteral(red: 0.2168482542, green: 0.2507516146, blue: 0.2559372783, alpha: 1)
			return flagsLabel
		}
		return KeyRow(type: .custom(view: view), model: flagsRowModel)
	}()
	
	private lazy var firstFlagRow: ValueRow = {
		let firstFlagRowModel = ValueRowModel(identifier: "gb", name: "Kingdom of Great Britain", description: "Everlasting kingdom")
		let view: () -> UIView = {
			let frame = CGRect(x: 0, y: 0, width: 48, height: 48)
			let firstFlagImage = UIImage(named: "GB")
			let firstFlagImageView = UIImageView(image: firstFlagImage)
			firstFlagImageView.frame = frame
			return firstFlagImageView
		}
		return ValueRow(type: .custom(view: view), model: firstFlagRowModel)
	}()
	
	private lazy var secondFlagRow: ValueRow = {
		let secondFlagRowModel = ValueRowModel(identifier: "kr", name: "Korea", description: "Part of asian continent")
		let view: () -> UIView = {
			let frame = CGRect(x: 0, y: 0, width: 48, height: 48)
			let secondFlagImage = UIImage(named: "KR")
			let secondFlagImageView = UIImageView(image: secondFlagImage)
			secondFlagImageView.frame = frame
			return secondFlagImageView
		}
		return ValueRow(type: .custom(view: view), model: secondFlagRowModel)
	}()
	
	private lazy var networksRow: KeyRow = {
		let networksRowModel = KeyRowModel(identifier: "networks", name: "Networks", description: "List of networks")
		let view: () -> UIView = {
			let networksLabel = UILabel()
			networksLabel.textAlignment = .center
			networksLabel.textColor = #colorLiteral(red: 0.2737779021, green: 0.4506875277, blue: 0.6578510404, alpha: 1)
			networksLabel.text = networksRowModel.name
			networksLabel.backgroundColor = #colorLiteral(red: 0.9962918162, green: 0.4853338599, blue: 0.3247181773, alpha: 1)
			return networksLabel
		}
		return KeyRow(type: .custom(view: view), model: networksRowModel)
	}()
	
	private lazy var githubRow: ValueRow = {
		let githubRowModel = ValueRowModel(identifier: "git", name: "Github", description: "Github")
		let view: () -> UIView = {
			let frame = CGRect(x: 0, y: 0, width: 48, height: 48)
			let image = UIImage(named: "github")
			let imageView = UIImageView(image: image)
			imageView.frame = frame
			return imageView
		}
		return ValueRow(type: .custom(view: view), model: githubRowModel)
	}()
	
	private lazy var twitterRow: ValueRow = {
		let twitterRowModel = ValueRowModel(identifier: "tweet", name: "Twitter", description: "Twitter")
		let view: () -> UIView = {
			let frame = CGRect(x: 0, y: 0, width: 48, height: 48)
			let image = UIImage(named: "twitter")
			let imageView = UIImageView(image: image)
			imageView.frame = frame
			return imageView
		}
		return ValueRow(type: .custom(view: view), model: twitterRowModel)
	}()
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
		selectedRowModelsLabel.text = ""
		singleColumnExample()
    }
	
	@IBAction func didPressSingleColumnButton(_ sender: UIButton) {
		selectedRowModelsLabel.text = ""
		manager?.updateColumns(columns: [])
		singleColumnExample()
	}
	
	@IBAction func didPressKeyValueColumnButton(_ sender: UIButton) {
		selectedRowModelsLabel.text = ""
		manager?.updateColumns(columns: [])
		keyValueColumnExample()
	}
	
	@IBAction func didPressKeyValueWithImageViewsColumnButton(_ sender: UIButton) {
		selectedRowModelsLabel.text = ""
		manager?.updateColumns(columns: [])
		keyValueWithImageViewsColumnExample()
	}
	
	@IBAction func didPressMultiColumnButton(_ sender: UIButton) {
		selectedRowModelsLabel.text = ""
		manager?.updateColumns(columns: [])
		multiColumnExample()
	}
}

extension ViewController {
	private func singleColumnExample() {
		do {
			var firstPickerViewRow: PickerViewRow {
				let model = ValueRowModel(identifier: "de", name: "Germany", description: "The Republic of Germany")
				var row = PickerViewRow(type: .plain(title: model.name))
				row.model = model
				return row
			}
			var secondPickerViewRow: PickerViewRow {
				let model = ValueRowModel(identifier: "hu", name: "Hungary", description: "Hungary")
				var row = PickerViewRow(type: .plain(title: model.name))
				row.model = model
				return row
			}
			var thirdPickerViewRow: PickerViewRow {
				let model = ValueRowModel(identifier: "lu", name: "Luxembourg", description: "Luxembourg")
				var row = PickerViewRow(type: .plain(title: model.name))
				row.model = model
				return row
			}
			let pickerViewRows = [firstPickerViewRow, secondPickerViewRow, thirdPickerViewRow]
			
			let firstPickerViewColumn = PickerViewColumn(rows: pickerViewRows, columnWidth: 128.0, rowHeight: 56.0)
			let pickerViewSetup = try PickerViewSetup(pickerView: pickerView, type: .single(column: firstPickerViewColumn), callback: self)
			manager = PickerViewManager(setup: pickerViewSetup)
		} catch {
			
		}
	}
	
	private func keyValueColumnExample() {
		do {
			let seasonColumn = PickerViewColumn(rows: [oneSeasonRow, anotherSeasonRow], columnWidth: 96.0)
			let episodeColumn = PickerViewColumn(rows: oneSeasonEpisodes)
			
			let pickerViewSetup = try PickerViewSetup(pickerView: pickerView, type: .keyValue(columns: [seasonColumn, episodeColumn]), callback: self)
			manager = PickerViewManager(setup: pickerViewSetup)
		} catch {
			
		}
	}
	
	private func keyValueWithImageViewsColumnExample() {
		do {
			let keyColumn = PickerViewColumn(rows: [flagsRow, networksRow], columnWidth: pickerView.frame.size.width - 56.0)
			let valueColumn = PickerViewColumn(rows: [firstFlagRow, secondFlagRow])
			
			let pickerViewSetup = try PickerViewSetup(pickerView: pickerView, type: .keyValue(columns: [keyColumn, valueColumn]), callback: self)
			manager = PickerViewManager(setup: pickerViewSetup)
		} catch {
			
		}
	}
	
	private func multiColumnExample() {
		do {
			let days: [PickerViewRowProtocol] = Array(1...30).map { number in
				let rowModel = ValueRowModel(identifier: "\(number)", name: "\(number)", description: "Day")
				return PickerViewRow(type: .plain(title: "\(number)"), model: rowModel)
			}
			
			let months: [PickerViewRowProtocol] = Array(1...12).map { number in
				let rowModel = ValueRowModel(identifier: "\(number)", name: "\(number)", description: "Month")
				return PickerViewRow(type: .plain(title: "\(number)"), model: rowModel)
			}
			
			let years: [PickerViewRowProtocol] = Array(1990...2000).map { number in
				let rowModel = ValueRowModel(identifier: "\(number)", name: "\(number)", description: "Year")
				return PickerViewRow(type: .plain(title: "\(number)"), model: rowModel)
			}
			
			let dayColumn = PickerViewColumn(rows: days, rowHeight: 72.0)
			let monthColumn = PickerViewColumn(rows: months, columnWidth: 96.0)
			let yearColumn = PickerViewColumn(rows: years)
			
			let pickerViewSetup = try PickerViewSetup(pickerView: pickerView, type: .multi(columns: [dayColumn, monthColumn, yearColumn]), callback: self)
			manager = PickerViewManager(setup: pickerViewSetup)
		} catch {
			
		}
	}
}

extension ViewController: PickerViewDelegateCallbackProtocol {
	func didSelectRow(_ delegate: PickerViewDelegateProtocol, in pickerView: UIPickerView, row: PickerViewRowProtocol, rowModels: [PickerViewRowModelProtocol]?) {
		guard let pickerViewType = pickerView.type else {
			return
		}
		
		switch pickerViewType {
			case .single, .multi:
				if let rowModels = rowModels {
					let names = rowModels.map { $0.name }
					selectedRowModelsLabel.text = names.joined(separator: " ")
				}
			
			case .keyValue:
				if let seasonRow = row as? SeasonRow, let seasonRowModel = seasonRow.model as? SeasonRowModel {
					var selectedRowsLabelText = seasonRowModel.name + " "
					
					switch seasonRowModel.identifier {
						case 6:
							manager?.updateRows(inColumn: 1, rows: oneSeasonEpisodes)
							selectedRowsLabelText += oneSeasonEpisodes[0].model?.name ?? ""
						
						case 7:
							manager?.updateRows(inColumn: 1, rows: anotherSeasonEpisodes)
							selectedRowsLabelText += anotherSeasonEpisodes[0].model?.name ?? ""
						
						default: ()
					}
					
					selectedRowModelsLabel.text = selectedRowsLabelText
				} else if let keyRow = row as? KeyRow, let keyRowModel = keyRow.model as? KeyRowModel {
					var selectedRowsLabelText = keyRowModel.name + " "
					
					switch keyRowModel.identifier {
						case "flags":
							manager?.updateRows(inColumn: 1, rows: [firstFlagRow, secondFlagRow])
							selectedRowsLabelText += firstFlagRow.model?.name ?? ""
						
						case "networks":
							manager?.updateRows(inColumn: 1, rows: [githubRow, twitterRow])
							selectedRowsLabelText += githubRow.model?.name ?? ""
						
						default: ()
					}
					
					selectedRowModelsLabel.text = selectedRowsLabelText
				} else {
					if let rowModels = rowModels {
						let names = rowModels.map { $0.name }
						selectedRowModelsLabel.text = names.joined(separator: " ")
					}
				}
		}
    }
}
