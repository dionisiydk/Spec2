Class {
	#name : #SpValueAspectTestCase,
	#superclass : #TestCase,
	#instVars : [
		'aspect'
	],
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #testing }
SpValueAspectTestCase class >> isAbstract [
	^self = SpValueAspectTestCase
]

{ #category : #helpers }
SpValueAspectTestCase >> aspectExample [
	self subclassResponsibility 
]

{ #category : #tests }
SpValueAspectTestCase >> testAllowAnyValueByDefault [

	aspect := self aspectExample.
	
	self assert: aspect restriction == SpAnyValueRestriction default
]

{ #category : #tests }
SpValueAspectTestCase >> testCheckingValidEmptyStringWhenItIsNotOptional [
	
	aspect := self aspectExample.
	aspect	
		optional
		emptyValues: #(nil '');
		restriction: SpEmptyTextRestriction not.
	
	self assert: (aspect isValueValid: '').
	aspect emptyValues: #().
	self deny: (aspect isValueValid: '').
]

{ #category : #tests }
SpValueAspectTestCase >> testCheckingValidNilValueWhenItIsNotOptional [
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	
	aspect := self aspectExample.
	aspect	
		restriction: (SpNumberRestriction minValue: 100 maxValue: 500).
			
	self deny: (aspect isValueValid: nil)
]

{ #category : #tests }
SpValueAspectTestCase >> testCheckingValidNilValueWhenItIsOptional [
	
	aspect := self aspectExample.
	aspect	
		optional
		restriction: (SpNumberRestriction minValue: 100 maxValue: 500).
			
	self assert: (aspect isValueValid: nil)
]

{ #category : #tests }
SpValueAspectTestCase >> testCheckingValidValue [
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	
	aspect := self aspectExample.
	aspect	
		restriction: (SpNumberRestriction minValue: 100 maxValue: 500).
	
	self assert: (aspect isValueValid: 300).
	self deny: (aspect isValueValid: 2)
]

{ #category : #tests }
SpValueAspectTestCase >> testCreationValueHolder [
	| actual |
	aspect := self aspectExample.
	
	actual := aspect asValueHolder.
	
	self assert: actual class equals: SpValueHolder.
	self assert: actual valueAspect equals: aspect.
	self assert: actual value equals: aspect readValue
]

{ #category : #tests }
SpValueAspectTestCase >> testForcingAutoAcceptingValues [

	aspect := self aspectExample.
	
	aspect autoAcceptValues.
	
	self assert: aspect allowsAutoAcceptValues
]

{ #category : #tests }
SpValueAspectTestCase >> testHasNoDisplayDecorationByDefault [

	aspect := self aspectExample.
	
	self assert: aspect displayDecoration == SpNoTextDecoration default
]

{ #category : #tests }
SpValueAspectTestCase >> testHasReadOnlyStateByDefault [

	aspect := SpObjectPropertyAspect new.
	
	self assert: aspect isReadOnly equals: aspect isAlwaysReadOnly
]

{ #category : #tests }
SpValueAspectTestCase >> testNotAllowAutoAcceptingValuesByDefault [

	aspect := self aspectExample.
	
	self deny: aspect allowsAutoAcceptValues
]

{ #category : #tests }
SpValueAspectTestCase >> testNotNilEmptyValueByDefault [

	aspect := self aspectExample.
	
	self assert: aspect emptyValues equals: #(nil)
]

{ #category : #tests }
SpValueAspectTestCase >> testNotOptionalByDefault [

	aspect := self aspectExample.
	
	self deny: aspect isOptional
]
