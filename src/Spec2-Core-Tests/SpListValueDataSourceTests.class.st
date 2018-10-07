Class {
	#name : #SpListValueDataSourceTests,
	#superclass : #TestCase,
	#category : #'Spec2-Core-Tests-Tests'
}

{ #category : #tests }
SpListValueDataSourceTests >> testCreationWithDatasetFromAspect [

	| dataset dataSource |
	dataset := { 10@29. 39@49 } aspect itself 
		dataset: [:ds | 
			ds aspect x.
			ds aspect y.
			ds expand: [:child | child aspect negated ]].

	dataSource := dataset dataSource.
	self assert: dataSource class equals: SpListValueDataSource 
]
