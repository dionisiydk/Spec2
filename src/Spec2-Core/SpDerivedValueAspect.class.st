Class {
	#name : #SpDerivedValueAspect,
	#superclass : #SpObjectPropertyAspect,
	#category : 'Spec2-Core-Models'
}

{ #category : #accessing }
SpDerivedValueAspect >> baseValue [
	^self baseValueHolder value
]

{ #category : #accessing }
SpDerivedValueAspect >> baseValueHolder [
	^object
]

{ #category : #operations }
SpDerivedValueAspect >> readValue [
	^valueGetter readAspectValueFrom: self baseValue
]

{ #category : #operations }
SpDerivedValueAspect >> writeValue: newValue [
	^self valueSetter writeAspectValue: newValue to: self baseValue
]
