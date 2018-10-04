Class {
	#name : #SpObjectToStringConverterTests,
	#superclass : #SpValueToStringConverterTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #running }
SpObjectToStringConverterTests >> convertedValueExample [
	^Object new displayString
]

{ #category : #running }
SpObjectToStringConverterTests >> createStringConverter [
	^SpObjectToStringConverter new
]

{ #category : #tests }
SpObjectToStringConverterTests >> testParsingValueFromString [

	self should: [converter parseValueFromString: 'any string'] raise: Error
]

{ #category : #running }
SpObjectToStringConverterTests >> valueExample [
	^Object new
]
