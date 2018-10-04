Class {
	#name : #SpDatasetItem,
	#superclass : #Object,
	#instVars : [
		'ownerDataset',
		'childrenDataset',
		'dataSourceItem'
	],
	#category : 'Spec2-Core-Dataset'
}

{ #category : #'instance creation' }
SpDatasetItem class >> of: aDataset item: aDataItem [ 
	^self new 
		ownerDataset: aDataset;
		dataSourceItem: aDataItem
]

{ #category : #accessing }
SpDatasetItem >> actualItem [
	^dataSourceItem actualItem
]

{ #category : #accessing }
SpDatasetItem >> childItemAt: ownerDatasetIndex [

	^childrenDataset itemAt: ownerDatasetIndex - self dataSourceIndex
]

{ #category : #accessing }
SpDatasetItem >> childItemsWith: actualObjects [
	childrenDataset ifNil: [ ^#() ].
	
	^childrenDataset itemsWith: actualObjects
]

{ #category : #accessing }
SpDatasetItem >> childrenCount [

	childrenDataset ifNil: [ ^0 ].
	
	^childrenDataset itemCount
]

{ #category : #accessing }
SpDatasetItem >> childrenDataset [
	^ childrenDataset
]

{ #category : #accessing }
SpDatasetItem >> childrenDataset: anObject [
	childrenDataset := anObject
]

{ #category : #controlling }
SpDatasetItem >> collapse [

	childrenDataset ifNil: [ ^self ].
	
	childrenDataset close.
	childrenDataset := nil.
	
	ownerDataset itemWasCollapsed: self
]

{ #category : #accessing }
SpDatasetItem >> dataSourceIndex [
	^dataSourceItem index
]

{ #category : #accessing }
SpDatasetItem >> dataSourceItem [
	^ dataSourceItem
]

{ #category : #accessing }
SpDatasetItem >> dataSourceItem: anObject [
	dataSourceItem := anObject
]

{ #category : #accessing }
SpDatasetItem >> depth [
	^ownerDataset depth + dataSourceItem depth
]

{ #category : #controlling }
SpDatasetItem >> expand [

	childrenDataset := dataSourceItem defaultChildren createDataset.
	childrenDataset 
		parentItem: self;
		depth: ownerDataset depth + 1;
		open.
	
	ownerDataset itemWasExpanded: self
]

{ #category : #accessing }
SpDatasetItem >> globalIndex [
	^ownerDataset convertToGlobalIndex: self dataSourceIndex
]

{ #category : #testing }
SpDatasetItem >> hasChildAt: ownerDatasetIndex [
	
	childrenDataset ifNil: [ ^false ].
	
	^ownerDatasetIndex > self dataSourceIndex and: [
		ownerDatasetIndex <= (self dataSourceIndex + self childrenCount)]
]

{ #category : #testing }
SpDatasetItem >> isEqualTo: aDatasetItem [ 
	^dataSourceItem isEqualTo: aDatasetItem dataSourceItem
]

{ #category : #testing }
SpDatasetItem >> isExpandable [

	^dataSourceItem defaultChildren isEmpty not
]

{ #category : #testing }
SpDatasetItem >> isExpanded [
	^childrenDataset notNil
]

{ #category : #testing }
SpDatasetItem >> isRemoved [
	^ownerDataset isExpanded not
]

{ #category : #accessing }
SpDatasetItem >> name [
	^dataSourceItem name
]

{ #category : #accessing }
SpDatasetItem >> ownerDataset [
	^ ownerDataset
]

{ #category : #accessing }
SpDatasetItem >> ownerDataset: anObject [
	ownerDataset := anObject
]

{ #category : #printing }
SpDatasetItem >> printOn: aStream [
	super printOn: aStream.
	
	aStream 
		nextPut: $(;
		nextPutAll: dataSourceItem name;
		nextPut: $).
]

{ #category : #controlling }
SpDatasetItem >> propogateChildrenChanges [

	ownerDataset announceChanges
]

{ #category : #controlling }
SpDatasetItem >> toggleExpansion [

	self isExpanded ifTrue: [ self collapse ] ifFalse: [ self expand ]
]
