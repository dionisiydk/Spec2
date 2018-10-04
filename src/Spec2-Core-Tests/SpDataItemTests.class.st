Class {
	#name : #SpDataItemTests,
	#superclass : #TestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #tests }
SpDataItemTests >> testAddDefaultChildren [

	| item children |
	item := 'test item' asDataItem.
	
	children := SpSimpleChildren items: #(1 2 3).
	item defaultChildren: children.
		
	self assert: item children size equals: 1.
	self assert: item defaultChildren equals: children.
	self assert: children name equals: #default
]

{ #category : #tests }
SpDataItemTests >> testAddDefaultChildrenAsArray [

	| item children |
	item := 'test item' asDataItem.
	
	children := #(1 2 3).
	item defaultChildren: children.
		
	self assert: item defaultChildren class equals: SpSimpleChildren.
	self assert: item defaultChildren items equals: children
]

{ #category : #tests }
SpDataItemTests >> testAddDefaultChildrenTwice [

	| item children children2 |
	item := 'test item' asDataItem.
	
	children := SpSimpleChildren items: #(1 2 3).
	item defaultChildren: children.
	
	children2 := SpSimpleChildren items: #(5 6 7).
	item defaultChildren: children2.	
		
	self assert: item children size equals: 1.
	self assert: item defaultChildren equals: children2
]

{ #category : #tests }
SpDataItemTests >> testComparisonWithAnotherItem [

	| item equalItem differentItem |
	item := SpDataItem of: 1 named: 'one'.
	equalItem := SpDataItem of: 1 named: 'one2'.
	differentItem := SpDataItem of: 2 named: 'two'.
	
	self assert: (item isEqualTo: item).
	self assert: (item isEqualTo: equalItem).
	self deny: (item isEqualTo: differentItem).
]

{ #category : #tests }
SpDataItemTests >> testConvertingToDataItem [

	| item |
	item := SpDataItem of: 10 named: 'test'.
	
	self assert: item asDataItem == item
]

{ #category : #tests }
SpDataItemTests >> testCreationFromObject [

	| item |
	item := 10 asDataItem.
	
	self assert: item class equals: SpDataItem.
	self assert: item actualItem equals: 10.
	self assert: item name equals: '10'.
]

{ #category : #tests }
SpDataItemTests >> testCreationFromString [

	| item |
	item := 'test item' asDataItem.
	
	self assert: item class equals: SpDataItem.
	self assert: item actualItem equals: 'test item'.
	self assert: item name equals: 'test item'.
]

{ #category : #tests }
SpDataItemTests >> testGettingDefaultChildrenWhenTheyNotExist [

	| item children |
	item := 'test item' asDataItem.
	
	children := item defaultChildren.
	
	self assert: children equals: SpAbsentChildren instance
]

{ #category : #tests }
SpDataItemTests >> testHasEmptyChildrenByDefault [

	| item |
	item := SpDataItem new.
	
	self assert: item children isEmpty
]

{ #category : #tests }
SpDataItemTests >> testHasZeroDepthByDefault [

	| item |
	item := SpDataItem new.
	
	self assert: item depth equals: 0
]
