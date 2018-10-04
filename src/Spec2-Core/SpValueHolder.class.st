Class {
	#name : #SpValueHolder,
	#superclass : #NewValueHolder,
	#instVars : [
		'valueAspect'
	],
	#category : 'Spec2-Core-Models'
}

{ #category : #'instance creation' }
SpValueHolder class >> fromAspect: aValueAspect [
	^self new 
		valueAspect: aValueAspect
]

{ #category : #controlling }
SpValueHolder >> acceptValue [

	self isReadOnly ifFalse: [ 
		valueAspect writeValue: value ]
]

{ #category : #'aspects creation' }
SpValueHolder >> asSimpleAspect [

	^self value asSimpleAspect
]

{ #category : #converting }
SpValueHolder >> asTextValueHolder [

	^SpPrintedValueHolder of: self stringConverter: valueAspect stringConverter
]

{ #category : #accessing }
SpValueHolder >> createInputPresenter [
	^valueAspect createInputPresenterFor: self
]

{ #category : #'aspects creation' }
SpValueHolder >> createPropertyAspectFrom: aPropertyGetterObject [

	^self value createPropertyAspectFrom: aPropertyGetterObject
]

{ #category : #testing }
SpValueHolder >> hasUnacceptedValue [

	^valueAspect readValue ~= value
]

{ #category : #testing }
SpValueHolder >> isOptional [
	^valueAspect isOptional
]

{ #category : #testing }
SpValueHolder >> isReadOnly [
	^valueAspect isReadOnly
]

{ #category : #testing }
SpValueHolder >> isValid [

	^valueAspect isValueValid: value
]

{ #category : #accessing }
SpValueHolder >> name [
	^valueAspect name
]

{ #category : #accessing }
SpValueHolder >> rawValue: aValue [
	super rawValue: aValue.
	
	(valueAspect allowsAutoAcceptValues and: [valueAspect isValueValid: aValue])
		ifTrue: [ self acceptValue]
]

{ #category : #subscription }
SpValueHolder >> unsubscribe: anObject [
	
	self announcer unsubscribe: anObject
]

{ #category : #accessing }
SpValueHolder >> value: anObject [
	
	self handleCircularReferencesWhile: [ | oldValue |
		oldValue := value.
		self rawValue: anObject.
		self valueChanged: oldValue ].
]

{ #category : #accessing }
SpValueHolder >> valueAspect [
	^ valueAspect
]

{ #category : #accessing }
SpValueHolder >> valueAspect: aValueAspect [
	valueAspect := aValueAspect.
	value := valueAspect readValue
]
