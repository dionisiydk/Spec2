Class {
	#name : #SpValueToStringConverterTestCase,
	#superclass : #TestCase,
	#instVars : [
		'converter'
	],
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #testing }
SpValueToStringConverterTestCase class >> isAbstract [
	^self = SpValueToStringConverterTestCase
]

{ #category : #running }
SpValueToStringConverterTestCase >> convertedValueExample [
	self subclassResponsibility 
]

{ #category : #running }
SpValueToStringConverterTestCase >> createStringConverter [
	self subclassResponsibility 
]

{ #category : #running }
SpValueToStringConverterTestCase >> setUp [
	super setUp.
	
	converter := self createStringConverter
]

{ #category : #tests }
SpValueToStringConverterTestCase >> testConvertingNilValueToString [

	| actual |
	actual := converter convertValueToString: nil.
	
	self assert: actual isString
]

{ #category : #tests }
SpValueToStringConverterTestCase >> testConvertingValueToString [

	| actual expected |
	actual := converter convertValueToString: self valueExample.
	
	expected := self convertedValueExample.	
	self assert: actual equals: expected
]

{ #category : #tests }
SpValueToStringConverterTestCase >> testHasDefaultInstance [

	self assert: converter class default == converter class default
]

{ #category : #tests }
SpValueToStringConverterTestCase >> testParsingValueFromString [

	| actual expected |
	actual := converter parseValueFromString: self convertedValueExample.
	expected := self valueExample.
	
	self assert: actual equals: expected
]

{ #category : #running }
SpValueToStringConverterTestCase >> valueExample [
	self subclassResponsibility 
]
