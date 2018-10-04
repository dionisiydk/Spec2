Class {
	#name : #SpItemNameColumn,
	#superclass : #SpDatasetColumn,
	#category : 'Spec2-Core-Dataset'
}

{ #category : #'building cells' }
SpItemNameColumn >> createCellPresenterFor: aDatasetItem [
	^SpDataItemNamePresenter on: aDatasetItem
]
