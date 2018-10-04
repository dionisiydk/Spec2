Class {
	#name : #SpValueAspect,
	#superclass : #Object,
	#instVars : [
		'name',
		'description',
		'isReadOnly',
		'allowsAutoAcceptValues',
		'isOptional',
		'emptyValues',
		'restriction',
		'stringConverter',
		'displayDecoration',
		'inputPresenter'
	],
	#category : 'Spec2-Core-Models'
}

{ #category : #accessing }
SpValueAspect >> allowsAutoAcceptValues [
	^ allowsAutoAcceptValues
]

{ #category : #accessing }
SpValueAspect >> allowsAutoAcceptValues: anObject [
	allowsAutoAcceptValues := anObject
]

{ #category : #converting }
SpValueAspect >> asTextValueHolder [

	^self asValueHolder asTextValueHolder
]

{ #category : #converting }
SpValueAspect >> asValueHolder [

	^SpValueHolder fromAspect: self
]

{ #category : #accessing }
SpValueAspect >> autoAcceptValues [
	allowsAutoAcceptValues := true
]

{ #category : #presentation }
SpValueAspect >> createInputPresenterFor: aValueHolder [

	^inputPresenter createNewOn: aValueHolder
]

{ #category : #accessing }
SpValueAspect >> defaultName [
	^'noname'
]

{ #category : #accessing }
SpValueAspect >> description [
	^ description
]

{ #category : #accessing }
SpValueAspect >> description: anObject [
	description := anObject
]

{ #category : #accessing }
SpValueAspect >> displayDecoration [
	^ displayDecoration
]

{ #category : #accessing }
SpValueAspect >> displayDecoration: anObject [
	displayDecoration := anObject
]

{ #category : #accessing }
SpValueAspect >> emptyValues [
	^ emptyValues
]

{ #category : #accessing }
SpValueAspect >> emptyValues: anObject [
	emptyValues := anObject
]

{ #category : #initialization }
SpValueAspect >> initialize [
	super initialize.
	
	allowsAutoAcceptValues := false.
	restriction := SpAnyValueRestriction default.
	displayDecoration := SpNoTextDecoration default.
	isReadOnly := self isAlwaysReadOnly.
	isOptional := false.
	emptyValues := #(nil)
]

{ #category : #accessing }
SpValueAspect >> inputPresenter [
	^ inputPresenter
]

{ #category : #accessing }
SpValueAspect >> inputPresenter: anObject [
	inputPresenter := anObject
]

{ #category : #initialization }
SpValueAspect >> isAlwaysReadOnly [
	^false
]

{ #category : #accessing }
SpValueAspect >> isOptional [
	^ isOptional
]

{ #category : #accessing }
SpValueAspect >> isOptional: anObject [
	isOptional := anObject
]

{ #category : #accessing }
SpValueAspect >> isReadOnly [
	^ isReadOnly
]

{ #category : #accessing }
SpValueAspect >> isReadOnly: aBoolean [
	aBoolean not & self isAlwaysReadOnly ifTrue: [ 
		self error: 'Aspect does not support writable mode' ].
	
	isReadOnly := aBoolean
]

{ #category : #testing }
SpValueAspect >> isValueValid: aValue [
	(isOptional and: [ emptyValues includes: aValue ]) 
		ifTrue: [ ^true ].
	
	^restriction matches: aValue
]

{ #category : #accessing }
SpValueAspect >> name [
	^ name ifNil: [ name := self defaultName ]
]

{ #category : #accessing }
SpValueAspect >> name: anObject [
	name := anObject
]

{ #category : #accessing }
SpValueAspect >> optional [
	isOptional := true
]

{ #category : #printing }
SpValueAspect >> printDetailsOn: aStream [

	aStream nextPutAll: self name
]

{ #category : #printing }
SpValueAspect >> printOn: aStream [
	super printOn: aStream.
	
	aStream nextPut: $(.
	self printDetailsOn: aStream.
	aStream nextPut: $)
]

{ #category : #accessing }
SpValueAspect >> readOnly [
	isReadOnly := true
]

{ #category : #operations }
SpValueAspect >> readValue [
	self subclassResponsibility 
]

{ #category : #accessing }
SpValueAspect >> restriction [
	^ restriction
]

{ #category : #accessing }
SpValueAspect >> restriction: anObject [
	restriction := anObject
]

{ #category : #initialization }
SpValueAspect >> setUpDefaultParameters [

	self readValue setUpDefaultAspectParameters: self
]

{ #category : #accessing }
SpValueAspect >> stringConverter [
	^ stringConverter
]

{ #category : #accessing }
SpValueAspect >> stringConverter: anObject [
	stringConverter := anObject
]

{ #category : #accessing }
SpValueAspect >> usePreviewWith: detailsPresenter [

	inputPresenter := SpObjectPreviewPresenter withDetails: detailsPresenter
]

{ #category : #operations }
SpValueAspect >> writeValue: anObject [
	self subclassResponsibility 
]
