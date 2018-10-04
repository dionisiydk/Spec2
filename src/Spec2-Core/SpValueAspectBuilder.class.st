Class {
	#name : #SpValueAspectBuilder,
	#superclass : #Object,
	#instVars : [
		'object',
		'aspect',
		'defaultParametersAreSet'
	],
	#category : 'Spec2-Core-Models'
}

{ #category : #'instance creation' }
SpValueAspectBuilder class >> for: anObject [
	^self new 
		object: anObject
]

{ #category : #'instance creation' }
SpValueAspectBuilder class >> forBlock: aBlock [
	^(self for: aBlock)
		createComputedAspect;
		yourself
]

{ #category : #'value holders' }
SpValueAspectBuilder >> asTextValueHolder [

	^self asValueHolder asTextValueHolder
]

{ #category : #'value holders' }
SpValueAspectBuilder >> asValueHolder [
	^self build asValueHolder
]

{ #category : #building }
SpValueAspectBuilder >> build [

	self ensureDefaultParameters.
	
	^aspect
]

{ #category : #'aspect definitions' }
SpValueAspectBuilder >> computedBy: aBlock [

	self createPropertyAspectFrom: aBlock
]

{ #category : #building }
SpValueAspectBuilder >> createComputedAspect [

	aspect := SpComputedValueAspect block: object
]

{ #category : #building }
SpValueAspectBuilder >> createPropertyAspectFrom: aPropertyGetterObject [

	aspect := object createPropertyAspectFrom: aPropertyGetterObject.
	aspect name: aPropertyGetterObject printAspectValueName
]

{ #category : #'aspect definitions' }
SpValueAspectBuilder >> doesNotUnderstand: aMessage [

	aspect 
		ifNil: [ 	self createPropertyAspectFrom: aMessage ]
		ifNotNil: [ 
			self ensureDefaultParameters.
			aMessage sendTo: aspect]
]

{ #category : #building }
SpValueAspectBuilder >> ensureDefaultParameters [
	defaultParametersAreSet ifTrue: [ ^self ].
	
	aspect setUpDefaultParameters.
	
	defaultParametersAreSet := true
]

{ #category : #initialization }
SpValueAspectBuilder >> initialize [
	super initialize.
	
	defaultParametersAreSet := false
]

{ #category : #'aspect definitions' }
SpValueAspectBuilder >> itself [

	aspect := object asSimpleAspect
]

{ #category : #accessing }
SpValueAspectBuilder >> object [
	^ object
]

{ #category : #accessing }
SpValueAspectBuilder >> object: anObject [
	object := anObject
]

{ #category : #printing }
SpValueAspectBuilder >> printOn: aStream [
	super printOn: aStream.
	
	aStream nextPut: $(.
	aspect 
		ifNil: [ aStream nextPutAll: 'undefined on ', object printString ]
		ifNotNil: [ aStream nextPutAll: aspect name, ' of ', object printString ].
	aStream nextPut: $).
]

{ #category : #'aspect definitions' }
SpValueAspectBuilder >> useSlot [
	"Method affects the getter of aspect. 
	We override it to avoid default parameters initialization 
	because value is used for this and it can be only accessing by slot (no getter selector exists)"
	aspect useSlot
]
