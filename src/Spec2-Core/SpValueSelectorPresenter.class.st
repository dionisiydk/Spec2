Class {
	#name : #SpValueSelectorPresenter,
	#superclass : #SpValueInputPresenter,
	#instVars : [
		'selectionStrategy',
		'optionDataset'
	],
	#category : 'Spec2-Core-Presenters'
}

{ #category : #'instance creation' }
SpValueSelectorPresenter class >> on: aValueHolder options: aDataset [

	^(self on: aValueHolder)
		optionDataset: aDataset
]

{ #category : #'instance creation' }
SpValueSelectorPresenter class >> options: aDataset [

	^self new
		optionDataset: aDataset
]

{ #category : #initialization }
SpValueSelectorPresenter >> attachToModel [
	super attachToModel.
	
	model whenChangedSend: #propogateChanges to: self
]

{ #category : #initialization }
SpValueSelectorPresenter >> initialize [
	super initialize.
	
	selectionStrategy := SpSingleSelectionStrategy new
]

{ #category : #accessing }
SpValueSelectorPresenter >> optionDataset [
	^ optionDataset
]

{ #category : #accessing }
SpValueSelectorPresenter >> optionDataset: aDatasetOrConvertable [
	optionDataset := aDatasetOrConvertable asSpecDataset 
]

{ #category : #accessing }
SpValueSelectorPresenter >> selectionStrategy [
	^ selectionStrategy
]

{ #category : #accessing }
SpValueSelectorPresenter >> selectionStrategy: anObject [
	selectionStrategy := anObject
]
