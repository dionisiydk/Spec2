Class {
	#name : #SpCommandExample2,
	#superclass : #CmdCommand,
	#category : 'Spec2-Core-Tests-Examples'
}

{ #category : #activation }
SpCommandExample2 class >> exampleToolbarActivation [
	<classAnnotation>
	
	^SpToolbarActivation for: SpMultiLabelPresenterExample
]

{ #category : #execution }
SpCommandExample2 >> execute [
	self inform: self printString
]
