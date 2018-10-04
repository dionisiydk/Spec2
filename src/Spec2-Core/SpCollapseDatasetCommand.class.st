Class {
	#name : #SpCollapseDatasetCommand,
	#superclass : #SpTraverseDatasetCommand,
	#category : 'Spec2-Core-Dataset'
}

{ #category : #accessing }
SpCollapseDatasetCommand >> defaultMenuIcon [

	^Smalltalk ui theme treeExpandedForm 
]

{ #category : #execution }
SpCollapseDatasetCommand >> execute [
	
	datasetItem collapse
]
