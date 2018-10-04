Class {
	#name : #SpDatasetContext,
	#superclass : #SpSimplePresenterContext,
	#instVars : [
		'selectedItems'
	],
	#category : 'Spec2-Core-Dataset'
}

{ #category : #'instance creation' }
SpDatasetContext class >> for: aDatasetPresenter selectedItems: items [
	^(self for: aDatasetPresenter)
		selectedItems: items
]

{ #category : #accessing }
SpDatasetContext >> hasManualSelection [
	^tool hasManualSelection
]

{ #category : #testing }
SpDatasetContext >> hasSelectedItems [
	^selectedItems notEmpty
]

{ #category : #initialization }
SpDatasetContext >> initialize [
	super initialize.
	
	selectedItems := #()
]

{ #category : #accessing }
SpDatasetContext >> manualSelection [
	^tool manualSelection
]

{ #category : #accessing }
SpDatasetContext >> selectedItems [
	^ selectedItems
]

{ #category : #accessing }
SpDatasetContext >> selectedItems: anObject [
	selectedItems := anObject
]
