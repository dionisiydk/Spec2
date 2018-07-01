# Spec2
Redesigned Spec UI framework

To install project in Pharo 7 use following script:
```Smalltalk
Metacello new
		baseline: 'Spec2';
		repository: 'github://dionisiydk/Spec2:dev';
		onConflict: [ :err | err useIncoming ]; 
		load.
```
Form example:
```Smalltalk
p := SpPointFormPresenterExample on: (1@3) aspect itself.
p openInWindow.
```
Dataset example:
```Smalltalk
ds := (SpSimpleDataSource on: (1 to: 1000) asArray) asSpecDataset.
(ds itemAt: 2) dataSourceItem defaultChildren: (#(a b c) collect: #asDataItem).
(ds itemAt: 2) dataSourceItem defaultChildren items first defaultChildren: #(9 8). 
(ds itemAt: 3) dataSourceItem defaultChildren: #(z x c).
p := SpDatasetPresenter on: ds.
p addSelection: SpManualSelection new.
p firstColumn beExpandable.
p openInWindow.
```
Then use this dataset instance for value selecting examples:
```Smalltalk
point := 2@3.
m := point aspect x useSlot readOnly autoAcceptValues asValueHolder.
p := SpSelectionBasedValueSelectorPresenter on: m options: ds.
p openInWindow.
m value: 1000.
```
ComboBox:
```Smalltalk
point := 2@3.
m := point aspect x useSlot readOnly autoAcceptValues asValueHolder.
p := SpComboBoxPresenter on: m options: ds.
p openInWindow.
m value: 1000.
```
Special selection column with radio button:
```Smalltalk
point := 2@3.
m := point aspect x useSlot readOnly autoAcceptValues asValueHolder.
p := SpColumnBasedValueSelectorPresenter on: m options: ds.
p openInWindow.
m value: 1000.
```
Multiple value selection using check box column:
```Smalltalk
m := #(1 2) aspect itself autoAcceptValues asValueHolder.
p := SpColumnBasedValueSelectorPresenter on: m options: ds.
p selectionStrategy: SpMultipleSelectionStrategy new.
p openInWindow.
m value: #(2).
```
