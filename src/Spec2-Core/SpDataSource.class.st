Class {
	#name : #SpDataSource,
	#superclass : #Object,
	#category : 'Spec2-Core-Dataset'
}

{ #category : #converting }
SpDataSource >> asSpecDataset [
	^SpDataset from: self
]

{ #category : #controlling }
SpDataSource >> close [
	self subclassResponsibility 
]

{ #category : #queries }
SpDataSource >> itemAt: index [
	self subclassResponsibility 
]

{ #category : #queries }
SpDataSource >> itemCount [
	self subclassResponsibility 
]

{ #category : #queries }
SpDataSource >> itemsWith: actualObjects [ 
	self subclassResponsibility 
]

{ #category : #controlling }
SpDataSource >> open [
	self subclassResponsibility 
]
