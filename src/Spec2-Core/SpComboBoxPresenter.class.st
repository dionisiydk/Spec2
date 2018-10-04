Class {
	#name : #SpComboBoxPresenter,
	#superclass : #SpValueSelectorPresenter,
	#instVars : [
		'valuePresenter',
		'optionButton'
	],
	#category : 'Spec2-Core-Presenters'
}

{ #category : #initialization }
SpComboBoxPresenter >> attachToModel [
	super attachToModel.
	
	model whenChangedSend: #propogateChanges to: self
]

{ #category : #initialization }
SpComboBoxPresenter >> createChildren [

	valuePresenter := SpTextInputPresenter on: model.
	valuePresenter textDecoration: model valueAspect displayDecoration.
	
	optionButton := SpCommandPresenter buttonOn: [ self popUpOptions ] named: '' iconName: #arrowDown
]

{ #category : #accessing }
SpComboBoxPresenter >> optionButton [
	^ optionButton
]

{ #category : #controlling }
SpComboBoxPresenter >> popUpOptions [

	| selectorPresenter |
	selectorPresenter := SpSelectionBasedValueSelectorPresenter on: model options: optionDataset.
	selectorPresenter selectionStrategy: selectionStrategy.
	selectorPresenter buildIn: ui.
	
	ui openInVerticalPopup: selectorPresenter over: view with: [ :popupView |
		ui layout: selectorPresenter with: [ :layout |
			layout layoutChildView: popupView with: [ :c | 
				c horizontal exact: view width.
				c vertical fitContent ]].
		selectorPresenter whenModelChangedDo: [ popupView close ].
	]
]

{ #category : #'styles-default' }
SpComboBoxPresenter >> setUpDefaultStyle [
	<styleSpec>
	
	ui layout: self with: [ :layout |
		layout beFlow horizontal.
		layout add: valuePresenter with: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ].
		layout add: optionButton with: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ]
	].

	ui when: SpMouseDown on: valuePresenter view do: [ self popUpOptions ].
]

{ #category : #accessing }
SpComboBoxPresenter >> valuePresenter [
	^ valuePresenter
]
