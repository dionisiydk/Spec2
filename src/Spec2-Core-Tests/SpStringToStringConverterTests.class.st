Class {
	#name : #SpStringToStringConverterTests,
	#superclass : #SpValueToStringConverterTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #running }
SpStringToStringConverterTests >> convertedValueExample [
	^'test string'
]

{ #category : #running }
SpStringToStringConverterTests >> createStringConverter [
	^SpStringToStringConverter new
]

{ #category : #running }
SpStringToStringConverterTests >> valueExample [
	^'test string'
]
