Class {
	#name : #SpValueSelectorColumn,
	#superclass : #SpDatasetColumn,
	#instVars : [
		'affectedModel',
		'selectionStrategy'
	],
	#category : 'Spec2-Core-Presenters'
}

{ #category : #'instance creation' }
SpValueSelectorColumn class >> for: aValueHolder strategy: aSelectionStrategy [

	^self new 
		affectedModel: aValueHolder;
		selectionStrategy: aSelectionStrategy
]

{ #category : #accessing }
SpValueSelectorColumn >> affectedModel [
	^ affectedModel
]

{ #category : #accessing }
SpValueSelectorColumn >> affectedModel: anObject [
	affectedModel := anObject
]

{ #category : #'building cells' }
SpValueSelectorColumn >> createCellPresenterFor: aDatasetItem [

	| cellModel |
	cellModel := selectionStrategy 
		prepareExistenceModelOfItem: aDatasetItem actualItem in: affectedModel.
	^cellModel createInputPresenter
]

{ #category : #accessing }
SpValueSelectorColumn >> defaultWidth [
	^16
]

{ #category : #accessing }
SpValueSelectorColumn >> selectionStrategy [
	^ selectionStrategy
]

{ #category : #accessing }
SpValueSelectorColumn >> selectionStrategy: anObject [
	selectionStrategy := anObject
]
