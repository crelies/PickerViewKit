# PickerViewKit

Easily setup your UIPickerView's using a model-based approach

![PickerViewKit: Model-based approach to setup your UIPickerView's and add data to them](https://github.com/crelies/PickerViewKit/blob/develop/docs/picker.png)


[![Version](https://img.shields.io/cocoapods/v/PickerViewKit.svg?longCache=true&style=flat-square)](http://cocoapods.org/pods/PickerViewKit)
[![Swift4](https://img.shields.io/badge/swift4-compatible-orange.svg?longCache=true&style=flat-square)](https://developer.apple.com/swift)
[![Platform](https://img.shields.io/badge/platform-iOS-lightgrey.svg?longCache=true&style=flat-square)](https://www.apple.com/de/ios)
[![Carthage](https://img.shields.io/badge/carthage-compatible-green.svg?longCache=true&style=flat-square)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/badge/license-MIT-lightgrey.svg?longCache=true&style=flat-square)](https://en.wikipedia.org/wiki/MIT_License)

With PickerViewKit you can quickly setup your picker views and provide data. Don't worry about creating a data source and delegate anymore. Use models for configuration and data supply.

## How to use

A *UIPickerView* consists of components and rows. Components are the columns of the picker view. Each column can have multiple rows.
The *PickerViewKit* represents a column with the value type *PickerViewColumn* and a row with *PickerViewRow*.
Rows can have a model which comes into play on row selection. Models can be implemented using *PickerViewRowModelProtocol*.

**1.** If your rows should represent a specific model implement a custom row model using *PickerViewRowModelProtocol*.

**2.** Create your rows using *PickerViewRow*.

**3.** Attach your rows to a *PickerViewColumn*. Set a row height for the column if you want.

**4.** Use *PickerViewSetup* to define all parameters for the picker view configuration. To be notified about row selections pass a callback/delegate implementing *PickerViewDelegateCallbackProtocol*.

**5.** Instantiate a *PickerViewManager* with your *PickerViewSetup*.

Now you are ready to go. You can update the columns or the rows in a column using your manager instance.

```swift
final class ViewController: UIViewController {
    @IBOutlet private weak var pickerView: UIPickerView!

    private var manager: PickerViewManager?

    override func viewDidLoad() {
        super.viewDidLoad()

        do {
            // 1.
            struct CustomPickerViewRowModel: PickerViewRowModelProtocol {
                var name: String
                var description: String
                var history: String
            }

            // 2.
            var pickerViewRow: PickerViewRow {
                let model = CustomPickerViewRowModel(name: "Germany", description: "The Republic of Germany", history: "Germany has a long history ...")
                var row = PickerViewRow(type: .plain(title: model.name))
                row.model = model
                return row
            }

            // 3.
            let pickerViewColumn = PickerViewColumn(rows: [pickerViewRow], rowHeight: 56.0)

            // 4.
            let pickerViewSetup = try PickerViewSetup(pickerView: pickerView, type: .single(column: pickerViewColumn), callback: self)

            // 5.
            manager = PickerViewManager(setup: pickerViewSetup)
        } catch {
            // picker view setup instantiation failed
        }
    }
}

extension ViewController: PickerViewDelegateCallbackProtocol {
    func didSelectRow(_ delegate: PickerViewDelegateProtocol, in pickerView: UIPickerView, row: PickerViewRowProtocol, rowModels: [PickerViewRowModelProtocol]?) {
        print(row.model?.name ?? "")
    }
}
```

### Static Picker view ###

If you want a simple static picker just create a setup with your columns.

### Dynamic Picker view ###

If you want to update the picker after initialization simply call `updateRows` or `updateColumn(atIndex:)` of the manager.

As a result of the update the first row in the updated column will be selected.

### Picker view types ###

*PickerViewKit* defines three different picker view types. During the setup process a type property (*PickerViewType*) is added to your *UIPickerView* instance.
The *PickerViewType* only describes the type of the *UIPickerView*.
The *PickerViewSetupType* is just a convenience to define the type and the columns of the picker view in one step.

| Feature | Single column | Key-Value column | Multi column |
| --- | --- | --- | --- |
| Number of columns | 1 | 2 | > 0 |
| Number of rows | >= 0 | >= 0 | >= 0 |
| Example | Country picker | Season and episode picker | Date picker |

**1. Single column**

This is a picker view with only one column and x rows.

```swift
do {
	let pickerViewColumn = PickerViewColumn(rows: [])
	let pickerViewSetup = try PickerViewSetup(pickerView: pickerView, type: .single(column: pickerViewColumn))
} catch {

}
```

**2. Key-Value column**

If you want to implement a season and episode picker you can use the key value column type.

```swift
do {
	let keyColumn = PickerViewColumn(rows: [])
	let valueColumn = PickerViewColumn(rows: [])
	let pickerViewSetup = try PickerViewSetup(pickerView: pickerView, type: .keyValue(columns: [keyColumn, valueColumn]))
} catch {

}
```

**3. Multi column**

Use the multi column type if you want more than two columns in your picker view.

```swift
do {
	let pickerViewColumn1 = PickerViewColumn(rows: [])
	let pickerViewColumn2 = PickerViewColumn(rows: [])
	let pickerViewSetup = try PickerViewSetup(pickerView: pickerView, type: .multi(columns: [pickerViewColumn1, pickerViewColumn2]))
} catch {

}
```

### Picker view setup ###

Use the *PickerViewSetup* value type to configure your picker view.

| Parameter | Type | Description | Default value |
| --- | --- | --- | --- |
| pickerView | *UIPickerView* |The picker view you want to setup | - |
| type | *PickerViewSetupType* | Specifies the type of the picker view | - |
| callback | *PickerViewDelegateCallbackProtocol* | Defines the callback which will be notified on row selection | nil |
| defaultColumnWidth | *CGFloat* | Sets the column width which will be used if you didn't specify a width on your columns | 48 |
| defaultRowHeight | *CGFloat* | Row height to use if not specified on column initialization | 48 |

### Column width and row height ###

If you want to specify the width of one column or the height of the rows in a column use the properties of *PickerViewColumn*. Keep in mind that you can't use different row heights in a multi column picker view.

```swift
let pickerViewRow = PickerViewRow(type: .plain(title: "Mock"))
let pickerViewColumn = PickerViewColumn(rows: [pickerViewRow], columnWidth: 128.0, rowHeight: 56.0)
```

### Row types ###

To define the look and feel of your rows you can choose from 3 row types:

**1. Plain**

A plain picker view row just displays the given title using an *UILabel*.

**2. Attributed**

Attributed picker view rows show the given attributed string using an *UILabel*.

**3. Custom**

Use the custom row type if you want to show custom styled rows to your users.
You pass in a block which returns an *UIView*. This is necessary because otherwise your custom view will be overlayed by a subview of the *UIPickerView*.

```swift
let view: () -> UIView = {
let frame = CGRect(x: 0, y: 0, width: 48, height: 48)
let image = UIImage(named: "github")
let imageView = UIImageView(image: image)
imageView.frame = frame
return imageView
}
let row = PickerViewRow(type: .custom(view: view))
```

## Example

Three classic examples show the use of the PickerViewKit.

**1. Country picker**

![Country picker](https://github.com/crelies/PickerViewKit/blob/develop/docs/country%20picker.gif)

**2. Season and Episode picker**

![Season and Episode picker](https://github.com/crelies/PickerViewKit/blob/develop/docs/season%20picker.gif)

**3. Date picker**

![Date picker](https://github.com/crelies/PickerViewKit/blob/develop/docs/date%20picker.gif)

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Customize

*PickerViewKit* is customizable.

You can create your own implementation of picker view rows using the *PickerViewRowProtocol*.
In addition you are free to create custom row models implementing the *PickerViewRowModelProtocol*.

## Requirements

Deployment target of your App is >= iOS 8.0 .

## Installation

*PickerViewKit* is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'PickerViewKit'
```

## Author

Christian Elies, chris.elies13@gmail.com

## License

*PickerViewKit* is available under the MIT license. See the LICENSE file for more info.
