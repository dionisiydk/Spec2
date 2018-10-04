Class {
	#name : #SpDataItem,
	#superclass : #Object,
	#instVars : [
		'name',
		'actualItem',
		'index',
		'priority',
		'depth',
		'children',
		'properties'
	],
	#category : 'Spec2-Core-Dataset'
}

{ #category : #'instance creation' }
SpDataItem class >> of: anObject named: aString [
	^self new 
		actualItem: anObject;
		name: aString
		
]

{ #category : #'instance creation' }
SpDataItem class >> of: anObject named: aString at: index [
	^(self of: anObject named: aString)
		index: index
]

{ #category : #accessing }
SpDataItem >> actualItem [
	^ actualItem
]

{ #category : #accessing }
SpDataItem >> actualItem: anObject [
	actualItem := anObject
]

{ #category : #accessing }
SpDataItem >> addChildren: aDataItemChildren [
	
	children removeAllSuchThat: [ :each | each name = aDataItemChildren name ].
	children add: aDataItemChildren
]

{ #category : #converting }
SpDataItem >> asDataItem [
	^self
]

{ #category : #accessing }
SpDataItem >> children [
	^ children
]

{ #category : #accessing }
SpDataItem >> children: anObject [
	children := anObject
]

{ #category : #accessing }
SpDataItem >> childrenNamed: aSymbol [

	^children detect: [ :each | each name = aSymbol ] ifNone: [ SpAbsentChildren instance ]
]

{ #category : #accessing }
SpDataItem >> defaultChildren [
	^self childrenNamed: #default
]

{ #category : #accessing }
SpDataItem >> defaultChildren: aDataItemChildrenOrConvertable [
	| newChildren |
	newChildren := aDataItemChildrenOrConvertable asDataItemChildren.
	newChildren name: #default.
	
	self addChildren: newChildren
]

{ #category : #accessing }
SpDataItem >> depth [
	^ depth
]

{ #category : #accessing }
SpDataItem >> depth: anObject [
	depth := anObject
]

{ #category : #accessing }
SpDataItem >> index [
	^ index
]

{ #category : #accessing }
SpDataItem >> index: anObject [
	index := anObject
]

{ #category : #initialization }
SpDataItem >> initialize [
	super initialize.
	
	depth := 0.
	children := OrderedCollection new
]

{ #category : #testing }
SpDataItem >> isEqualTo: aDataItem [ 
	self = aDataItem ifTrue: [ ^true ].
	
	^actualItem = aDataItem actualItem
]

{ #category : #accessing }
SpDataItem >> name [
	^ name
]

{ #category : #accessing }
SpDataItem >> name: anObject [
	name := anObject
]

{ #category : #printing }
SpDataItem >> printOn: aStream [
	super printOn: aStream.
	
	aStream 
		nextPut: $(;
		nextPutAll: name;
		nextPut: $).
]

{ #category : #accessing }
SpDataItem >> priority [
	^ priority
]

{ #category : #accessing }
SpDataItem >> priority: anObject [
	priority := anObject
]

{ #category : #accessing }
SpDataItem >> properties [
	^ properties
]

{ #category : #accessing }
SpDataItem >> properties: anObject [
	properties := anObject
]
