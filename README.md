# PickerViewKit

Easily setup your UIPickerView's using a model-based approach

![PickerViewKit: Model-based approach to setup your UIPickerView's and add data to them](https://github.com/crelies/PickerViewKit/blob/develop/images/picker.png)


[![Version](https://img.shields.io/cocoapods/v/PickerViewKit.svg?longCache=true&style=flat-square)](http://cocoapods.org/pods/PickerViewKit)
[![Swift4](https://img.shields.io/badge/swift4-compatible-orange.svg?longCache=true&style=flat-square)](https://developer.apple.com/swift)
[![Platform](https://img.shields.io/badge/platform-iOS-lightgrey.svg?longCache=true&style=flat-square)](https://www.apple.com/de/ios)
[![Carthage](https://img.shields.io/badge/carthage-compatible-green.svg?longCache=true&style=flat-square)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/badge/license-MIT-lightgrey.svg?longCache=true&style=flat-square)](https://en.wikipedia.org/wiki/MIT_License)

With PickerViewKit you can quickly setup your picker views and provide data. Don't worry about creating a data source and delegate anymore. Use models for configuration and data supply.

## How to use

A *UIPickerView* consists of components and rows. Components are the columns of the picker view. Each column can have multiple rows.
The *PickerViewKit* represents a column with the value type *PickerViewColumn* and a row with *PickerViewRow*.
Rows can have a model which comes into play on row selection. Models have to conform to the *Equatable* protocol.

**1.** Each row represents a specific model, so create a model conforming to the *Equatable* protocol.

**2.** Create your rows using *PickerViewRow*.

**3.** Attach your rows to a *PickerViewColumn*.

**4.** Use *PickerViewConfiguration* to define all parameters for the picker view configuration. To be notified about row selections pass an object conforming to the *PickerViewDelegate* protocol.

**5.** Instantiate a *PickerViewService* with your *PickerViewConfiguration*.

Now you are ready to go. You can update the columns or the rows in a column using your service instance.

```swift
final class ViewController: UIViewController {
    @IBOutlet private weak var pickerView: UIPickerView!

    private var pickerViewService: PickerViewService?

    override func viewDidLoad() {
        super.viewDidLoad()

        // 1.
        struct CustomPickerViewRowModel: Equatable {
            let name: String
            let description: String
            let history: String
        }

        // 2.
        var pickerViewRow: PickerViewRow {
            let model = CustomPickerViewRowModel(name: "Germany", description: "The Republic of Germany", history: "Germany has a long history ...")
            return PickerViewRow(type: .plain(title: model.name), model: model)
        }

        // 3.
        let pickerViewColumn = PickerViewColumn(rows: [pickerViewRow])

        // 4.
        let pickerViewConfiguration = PickerViewConfiguration(pickerView: pickerView, columns: [pickerViewColumn], delegate: self, rowHeight: 56)

        // 5.
        pickerViewService = PickerViewService(setup: pickerViewConfiguration)
    }
}

extension ViewController: PickerViewDelegateCallbackProtocol {
    func didSelectRow(_ delegate: PickerViewDelegateProtocol, in pickerView: UIPickerView, row: PickerViewRowProtocol, rowModels: [PickerViewRowModelProtocol]?) {
        print(row.model?.name ?? "")
    }
}
```

### Picker view setup ###

Use the *PickerViewSetup* value type to configure your picker view.

| Parameter | Type | Description | Default value |
| --- | --- | --- | --- |
| pickerView | *UIPickerView* |The picker view you want to setup | - |
| columns | Array of *PickerViewColumn* | Specifies the columns of the picker view | - |
| delegate | *PickerViewDelegate* | Defines the delegate which will be notified on row selection | nil |
| rowHeight | *CGFloat* | Height of each row in the picker view | 48 |

### Column width ###

If you want to specify the width of one column use the property on *PickerViewColumn*. Keep in mind that you can't use different row heights in a multi column picker view.

```swift
let pickerViewRow = PickerViewRow(type: .plain(title: "Mock"))
let pickerViewColumn = PickerViewColumn(rows: [pickerViewRow], columnWidth: 128.0)
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

![Country picker](https://github.com/crelies/PickerViewKit/blob/develop/images/country%20picker.gif)

**2. Season and Episode picker**

![Season and Episode picker](https://github.com/crelies/PickerViewKit/blob/develop/images/season%20picker.gif)

**3. Date picker**

![Date picker](https://github.com/crelies/PickerViewKit/blob/develop/images/date%20picker.gif)

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Customize

*PickerViewKit* is customizable.

You can create your own implementation of picker view rows using the *PickerViewRowProtocol*.
In addition you are free to create custom row models implementing the *PickerViewRowModelProtocol*.

## Documentation ##

[Code documentation](https://crelies.github.io/PickerViewKit/)

## Requirements

Deployment target of your App is >= iOS 8.0 .

## Installation

*PickerViewKit* is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'PickerViewKit'
```

## Migration from Version 1 to Version 2

One of the breaking changes of Version 2 is the removal of the *PickerViewSetupType* and the *PickerViewType*. These types were confusing and unnecessary.

Instead of specifying a type on *PickerViewSetup* initialization you can now directly pass your *PickerViewColumn*s. In addition the *PickerViewSetup* initialization is not failable anymore.

```swift
Version 1:
let pickerViewColumn = PickerViewColumn(rows: [], rowHeight: 56.0)
let pickerViewSetup = try PickerViewSetup(pickerView: pickerView, type: .single(column: pickerViewColumn), callback: self)

Version 2:
let pickerViewColumn = PickerViewColumn(rows: [], rowHeight: 56.0)
let pickerViewSetup = PickerViewSetup(pickerView: pickerView, columns: [pickerViewColumn], callback: self)
```

## Migration from Version 2 to Version 3

TBD

## Author

Christian Elies, chris.elies13@gmail.com

## License

*PickerViewKit* is available under the MIT license. See the LICENSE file for more info.
