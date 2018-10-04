Class {
	#name : #SpCommandExample1,
	#superclass : #CmdCommand,
	#category : 'Spec2-Core-Tests-Examples'
}

{ #category : #activation }
SpCommandExample1 class >> exampleDatasetDoubleClickActivation [
	<classAnnotation>
	
	^CmdDoubleClickActivation for: SpDatasetContextExample 
]

{ #category : #activation }
SpCommandExample1 class >> exampleDatasetMenuActivation [
	<classAnnotation>
	
	^CmdContextMenuActivation byRootGroupItemFor: SpDatasetContextExample
]

{ #category : #activation }
SpCommandExample1 class >> exampleToolbarActivation [
	<classAnnotation>
	
	^SpToolbarActivation for: SpMultiLabelPresenterExample
]

{ #category : #execution }
SpCommandExample1 >> execute [
	self inform: self printString
]
