Class {
	#name : #SpValueInputPresenterTestCase,
	#superclass : #SpPresenterTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #testing }
SpValueInputPresenterTestCase class >> isAbstract [
	^self = SpValueInputPresenterTestCase 
]

{ #category : #'instance creation' }
SpValueInputPresenterTestCase >> newValueForModel [
	self subclassResponsibility 
]

{ #category : #tests }
SpValueInputPresenterTestCase >> testConvertModelToValueHolder [

	presenter model: model valueAspect.
	
	self assert: presenter model class equals: SpValueHolder.
	self assert: presenter model valueAspect class equals: model valueAspect class
]

{ #category : #tests }
SpValueInputPresenterTestCase >> testDetachingFromModel [

	presenter detachFromModel.
	
	self deny: (model announcer hasSubscriber: presenter)
]

{ #category : #tests }
SpValueInputPresenterTestCase >> testPropogatesModelChanges [
	| parent executed |
	executed := false.
	parent := SpMultiLabelPresenterExample new.
	presenter parent: parent.
	parent whenModelChangedDo: [ executed := true ].
	
	presenter model value: self newValueForModel.
	
	self assert: executed
]
