Class {
	#name : #SpPrintedValueHolder,
	#superclass : #NewValueHolder,
	#instVars : [
		'baseValueHolder',
		'stringConverter'
	],
	#category : 'Spec2-Core-Models'
}

{ #category : #'instance creation' }
SpPrintedValueHolder class >> of: aValueHolder stringConverter: aValueToStringConverter [
	^self new 
		baseValueHolder: aValueHolder;
		stringConverter: aValueToStringConverter;
		synchronize
		
]

{ #category : #converting }
SpPrintedValueHolder >> asTextValueHolder [
	^self
]

{ #category : #accessing }
SpPrintedValueHolder >> baseValueHolder [
	^ baseValueHolder
]

{ #category : #accessing }
SpPrintedValueHolder >> baseValueHolder: aValueHolder [
	baseValueHolder := aValueHolder
]

{ #category : #subscription }
SpPrintedValueHolder >> ensureBaseValueSubscription [

	(baseValueHolder announcer hasSubscriber: self) ifTrue: [ ^self ].
	
	baseValueHolder whenChangedSend: #synchronize to: self.
	self synchronizeSilently. "we should always be in sync with vase value when some observer is subscribed"
]

{ #category : #testing }
SpPrintedValueHolder >> isReadOnly [
	^baseValueHolder isReadOnly or: [ stringConverter supportsConvertionFromString not ]
]

{ #category : #testing }
SpPrintedValueHolder >> isValid [
	^baseValueHolder isValid
]

{ #category : #accessing }
SpPrintedValueHolder >> rawValue: aString [
	| parsedValue |
	super rawValue: aString.
	
	parsedValue := [ stringConverter parseValueFromString: aString ] on: Error do: [ :err | 
		SpInvalidValue with: aString ].
	
	baseValueHolder value: parsedValue
]

{ #category : #accessing }
SpPrintedValueHolder >> stringConverter [
	^ stringConverter
]

{ #category : #accessing }
SpPrintedValueHolder >> stringConverter: anObject [
	stringConverter := anObject
]

{ #category : #accessing }
SpPrintedValueHolder >> synchronize [

	self handleCircularReferencesWhile: [ | oldValue |
		oldValue := value.
		self synchronizeSilently.
		self valueChanged: oldValue]
]

{ #category : #accessing }
SpPrintedValueHolder >> synchronizeSilently [
	value := baseValueHolder value convertValueToStringBy: stringConverter
]

{ #category : #subscription }
SpPrintedValueHolder >> unsubscribe: anObject [
	
	self announcer unsubscribe: anObject.
	
	announcer numberOfSubscriptions = 0 ifTrue: [ 
		baseValueHolder announcer unsubscribe: self ]
]

{ #category : #accessing }
SpPrintedValueHolder >> value: aString [
	
	self handleCircularReferencesWhile: [ | oldValue |
		oldValue := value.
		self rawValue: aString.
		self valueChanged: oldValue ].
]

{ #category : #subscription }
SpPrintedValueHolder >> whenChangedDo: aBlock [
	super whenChangedDo: aBlock.
	
	self ensureBaseValueSubscription
]

{ #category : #subscription }
SpPrintedValueHolder >> whenChangedSend: aSelector to: aSubscriber [
	super whenChangedSend: aSelector to: aSubscriber.
	
	self ensureBaseValueSubscription	
]
