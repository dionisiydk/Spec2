Class {
	#name : #SpExpandDatasetCommand,
	#superclass : #SpTraverseDatasetCommand,
	#category : 'Spec2-Core-Dataset'
}

{ #category : #accessing }
SpExpandDatasetCommand >> defaultMenuIcon [

	^Smalltalk ui theme treeUnexpandedForm 
]

{ #category : #execution }
SpExpandDatasetCommand >> execute [
	
	datasetItem expand
]
