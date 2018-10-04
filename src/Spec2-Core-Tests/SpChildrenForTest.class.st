Class {
	#name : #SpChildrenForTest,
	#superclass : #SpSimpleChildren,
	#category : 'Spec2-Core-Tests-Examples'
}

{ #category : #accessing }
SpChildrenForTest >> createDataset [
	^(SpDataSourceForTest on: items) asSpecDataset 
]
