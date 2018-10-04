Class {
	#name : #SpManualSelection,
	#superclass : #SpDatasetSelection,
	#category : 'Spec2-Core-Dataset'
}

{ #category : #initialization }
SpManualSelection >> attachToView: aDatasetView [ 
	aDatasetView enableManualSelection: self
]

{ #category : #testing }
SpManualSelection >> providesItemsForContext [
	^true
]
