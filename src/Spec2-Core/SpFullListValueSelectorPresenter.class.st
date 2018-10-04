Class {
	#name : #SpFullListValueSelectorPresenter,
	#superclass : #SpValueSelectorPresenter,
	#instVars : [
		'optionPresenter',
		'optionSelection'
	],
	#category : 'Spec2-Core-Presenters'
}

{ #category : #initialization }
SpFullListValueSelectorPresenter >> createChildren [
	optionPresenter := SpDatasetPresenter on: optionDataset.
	optionSelection := optionPresenter addSelection: (SpManualSelection withStrategy: selectionStrategy)
]

{ #category : #accessing }
SpFullListValueSelectorPresenter >> optionPresenter [
	^ optionPresenter
]

{ #category : #accessing }
SpFullListValueSelectorPresenter >> optionSelection [
	^ optionSelection
]

{ #category : #'styles-default' }
SpFullListValueSelectorPresenter >> setUpDefaultStyle [
	<styleSpec>
	
	ui layout: self with: [ :layout | 
		layout beFlow horizontal.
		layout add: optionPresenter with: [ :c | 
			c horizontal matchParent.
			c vertical matchParent]
	]
]
