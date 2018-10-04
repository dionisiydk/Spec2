Class {
	#name : #SpNumberToStringConverterTests,
	#superclass : #SpValueToStringConverterTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #running }
SpNumberToStringConverterTests >> convertedValueExample [
	^'123.23'
]

{ #category : #running }
SpNumberToStringConverterTests >> createStringConverter [
	^SpNumberToStringConverter new
]

{ #category : #tests }
SpNumberToStringConverterTests >> testParsingCorrectStringWithCommaSeparator [

	| number |
	number := converter parseValueFromString: '1,23'.
	self assert: number equals: 1.23
]

{ #category : #tests }
SpNumberToStringConverterTests >> testParsingCorrectStringWithDecimalSeparatorAtTheEnd [

	| number |
	number := converter parseValueFromString: '123.'.
	self assert: number equals: 123
]

{ #category : #tests }
SpNumberToStringConverterTests >> testParsingCorrectStringWithDecimalSeparatorAtTheStart [

	| number |
	number := converter parseValueFromString: '.123'.
	self assert: number equals: 0.123
]

{ #category : #tests }
SpNumberToStringConverterTests >> testParsingCorrectStringWithOnlyDecimalSeparatorWithoutAnyDigits [

	| number |
	number := converter parseValueFromString: '.'.
	self assert: number equals: 0
]

{ #category : #tests }
SpNumberToStringConverterTests >> testParsingEmptyString [

	| number |
	number := converter parseValueFromString: ''.
	self assert: number equals: nil
]

{ #category : #tests }
SpNumberToStringConverterTests >> testParsingIncorrectStringWhichBeginsWithDigits [

	self should: [converter parseValueFromString: '123avc'] raise: SpBadStringFormat
]

{ #category : #tests }
SpNumberToStringConverterTests >> testParsingIncorrectStringWithMultipleDecimalSeparators [

	self should: [converter parseValueFromString: '1.2.3'] raise: SpBadStringFormat
]

{ #category : #tests }
SpNumberToStringConverterTests >> testParsingIncorrectStringWithoutDigits [

	self should: [converter parseValueFromString: 'abc'] raise: SpBadStringFormat
]

{ #category : #tests }
SpNumberToStringConverterTests >> testParsingNegativeNumericString [

	| number |
	number := converter parseValueFromString: '-1.23'.
	self assert: number equals: -1.23
]

{ #category : #tests }
SpNumberToStringConverterTests >> testParsingNegativeNumericStringWhichHasOnlyMinusAndDot [

	| number |
	number := converter parseValueFromString: '-.'.
	self assert: number equals: 0
]

{ #category : #running }
SpNumberToStringConverterTests >> valueExample [
	^123.23
]
