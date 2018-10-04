Class {
	#name : #SpCompositeViewStub,
	#superclass : #SpViewStub,
	#category : 'Spec2-Core-Tests-StubUI'
}

{ #category : #'instance creation' }
SpCompositeViewStub class >> with: subviews [
	^self new 
		contents: subviews
]

{ #category : #initialization }
SpCompositeViewStub >> initialize [
	super initialize.
	
	contents := OrderedCollection new
]
