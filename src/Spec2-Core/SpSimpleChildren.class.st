Class {
	#name : #SpSimpleChildren,
	#superclass : #SpDataItemChildren,
	#instVars : [
		'items'
	],
	#category : 'Spec2-Core-Dataset'
}

{ #category : #'instance creation' }
SpSimpleChildren class >> items: aCollection [ 
	^self new 
		items: aCollection
]

{ #category : #accessing }
SpSimpleChildren >> createDataset [
	^(SpSimpleDataSource on: items) asSpecDataset
]

{ #category : #testing }
SpSimpleChildren >> isEmpty [
	^items isEmpty
]

{ #category : #accessing }
SpSimpleChildren >> items [
	^ items
]

{ #category : #accessing }
SpSimpleChildren >> items: anObject [
	items := anObject
]
