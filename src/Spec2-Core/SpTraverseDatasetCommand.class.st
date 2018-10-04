Class {
	#name : #SpTraverseDatasetCommand,
	#superclass : #SpDatasetCommand,
	#instVars : [
		'datasetItem'
	],
	#category : 'Spec2-Core-Dataset'
}

{ #category : #accessing }
SpTraverseDatasetCommand class >> atItem: aDatasetItem [
	^self new 
		datasetItem: aDatasetItem
]

{ #category : #accessing }
SpTraverseDatasetCommand >> datasetItem [
	^ datasetItem
]

{ #category : #accessing }
SpTraverseDatasetCommand >> datasetItem: anObject [
	datasetItem := anObject
]
