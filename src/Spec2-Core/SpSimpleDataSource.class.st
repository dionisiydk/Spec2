Class {
	#name : #SpSimpleDataSource,
	#superclass : #SpDataSource,
	#instVars : [
		'items'
	],
	#category : 'Spec2-Core-Dataset'
}

{ #category : #'instance creation' }
SpSimpleDataSource class >> on: anArray [
	^self new 
		actualItems: anArray
]

{ #category : #accessing }
SpSimpleDataSource >> actualItems [
	^ items collect: [ :each | each actualItem ]
]

{ #category : #accessing }
SpSimpleDataSource >> actualItems: anArray [
	| index |
	index := 0.
	items := anArray 
		collect: [ :each | each asDataItem index: (index := index + 1) ] 
		as: Array
]

{ #category : #controlling }
SpSimpleDataSource >> close [

]

{ #category : #queries }
SpSimpleDataSource >> itemAt: index [
	^items at: index
]

{ #category : #queries }
SpSimpleDataSource >> itemCount [
	^items size
]

{ #category : #accessing }
SpSimpleDataSource >> items: dataItemsArray [
	items := dataItemsArray
]

{ #category : #queries }
SpSimpleDataSource >> itemsWith: actualObjects [
	| index |
	^actualObjects collect: [ :each | 
		index := items findFirst: [:existing | existing actualItem = each].
		index = 0 ifTrue: [ nil ] ifFalse: [ self itemAt: index ]]
]

{ #category : #controlling }
SpSimpleDataSource >> open [

]
