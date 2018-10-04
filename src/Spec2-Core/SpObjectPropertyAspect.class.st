Class {
	#name : #SpObjectPropertyAspect,
	#superclass : #SpValueAspect,
	#instVars : [
		'object',
		'valueGetter',
		'valueSetter'
	],
	#category : 'Spec2-Core-Models'
}

{ #category : #'instance creation' }
SpObjectPropertyAspect class >> of: anObject getter: aSelector [
	^self new 
		object: anObject;
		valueGetter: aSelector
]

{ #category : #accessing }
SpObjectPropertyAspect >> defaultName [
	^ valueGetter printAspectValueName
]

{ #category : #accessing }
SpObjectPropertyAspect >> object [
	^ object
]

{ #category : #accessing }
SpObjectPropertyAspect >> object: anObject [
	object := anObject
]

{ #category : #printing }
SpObjectPropertyAspect >> printDetailsOn: aStream [
	super printDetailsOn: aStream.
	
	aStream nextPutAll: ' of '; print: object
	
]

{ #category : #operations }
SpObjectPropertyAspect >> readValue [
	^valueGetter readAspectValueFrom: object 
]

{ #category : #accessing }
SpObjectPropertyAspect >> useSlot [

	valueGetter := valueGetter asAspectSlotGetterOf: object class
]

{ #category : #accessing }
SpObjectPropertyAspect >> valueGetter [
	^ valueGetter
]

{ #category : #accessing }
SpObjectPropertyAspect >> valueGetter: anObject [
	valueGetter := anObject
]

{ #category : #accessing }
SpObjectPropertyAspect >> valueSetter [
	^ valueSetter ifNil: [ 
		isReadOnly 
			ifTrue: [ nil ] 
			ifFalse: [ valueSetter := valueGetter asAspectValueSetterOrNil ] ]
]

{ #category : #accessing }
SpObjectPropertyAspect >> valueSetter: anObject [
	valueSetter := anObject
]

{ #category : #operations }
SpObjectPropertyAspect >> writeValue: newValue [
	^self valueSetter writeAspectValue: newValue to: object
]
