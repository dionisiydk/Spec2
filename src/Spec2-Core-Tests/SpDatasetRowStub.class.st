Class {
	#name : #SpDatasetRowStub,
	#superclass : #SpCompositeViewStub,
	#category : 'Spec2-Core-Tests-StubUI'
}

{ #category : #accessing }
SpDatasetRowStub >> cellViewAt: columnIndex [
	^contents at: columnIndex
]
