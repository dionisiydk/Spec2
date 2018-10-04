"
I implement number convertion to and from string.
I allow to use any decimal separators from my #decimalSeparators variable. By default I allow dot and comma.
"
Class {
	#name : #SpNumberToStringConverter,
	#superclass : #SpValueToStringConverter,
	#instVars : [
		'decimalSeparators'
	],
	#category : 'Spec2-Core-Models'
}

{ #category : #operations }
SpNumberToStringConverter >> convertValueToString: aNumber [
	^aNumber displayString
]

{ #category : #accessing }
SpNumberToStringConverter >> decimalSeparators [
	^ decimalSeparators
]

{ #category : #accessing }
SpNumberToStringConverter >> decimalSeparators: anObject [
	decimalSeparators := anObject
]

{ #category : #initialization }
SpNumberToStringConverter >> initialize [
	super initialize.
	
	decimalSeparators := #($, $.)
]

{ #category : #operations }
SpNumberToStringConverter >> normalizeNumericString: aString [
	| result signed |
	result := aString copyReplaceAll: ',' with: '.'.
	signed := aString first = $-.
	signed ifTrue: [ result := result allButFirst ].
	
	(decimalSeparators includes: result first) ifTrue: [ result := '0', result ].
	^signed 
		ifTrue: [ '-', result ]
		ifFalse: [result]
]

{ #category : #operations }
SpNumberToStringConverter >> parseValueFromString: aString [
	| digitCount separatorCount normalizedString signed |
	aString ifEmpty: [ ^nil ].
	normalizedString := self normalizeNumericString: aString.
	signed := normalizedString first = $-.
	digitCount := 0.
	separatorCount := 0.
	normalizedString do: [ :char | 
		char isDigit 
			ifTrue: [ digitCount := digitCount + 1 ]
			ifFalse: [ (decimalSeparators includes: char) 
				ifTrue: [separatorCount := separatorCount + 1]]
	].
	digitCount + (separatorCount min: 1) + signed asBit = normalizedString size 
		ifFalse: [ SpBadStringFormat signal ].
	^normalizedString asNumber
]
