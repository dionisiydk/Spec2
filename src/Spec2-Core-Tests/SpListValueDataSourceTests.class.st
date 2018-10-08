Class {
	#name : #SpListValueDataSourceTests,
	#superclass : #TestCase,
	#category : #'Spec2-Core-Tests-Tests'
}

{ #category : #tests }
SpListValueDataSourceTests >> testCreationFromListAspect [

	| dataSource |
	dataSource := #(1 2 3) aspect itself asDataSource.
	self assert: dataSource class equals: SpListValueDataSource.
	self assert: dataSource listHolder value equals: #(1 2 3)
]

{ #category : #tests }
SpListValueDataSourceTests >> testCreationWithItemAspectsFromListHolder [

	| dataSource |
	dataSource := { 10@29. 39@49 } aspect itself 
		asDataSource: [:ds | 
			ds aspect x.
			ds aspect y].

	self assert: dataSource class equals: SpListValueDataSource 
]

{ #category : #tests }
SpListValueDataSourceTests >> testCreationWithItemChildrenFromListHolder [

	| dataSource |
	dataSource := { 10@29. 39@49 } aspect itself 
		asDataSource: [:ds | 
			ds expand: [ :item | item aspect negated ]].

	self assert: dataSource class equals: SpListValueDataSource 
]

{ #category : #tests }
SpListValueDataSourceTests >> testHasEmptyItemAspectsByDefault [

	| dataSource |
	dataSource := SpListValueDataSource new.
	self assert: dataSource itemAspects isEmpty
]
