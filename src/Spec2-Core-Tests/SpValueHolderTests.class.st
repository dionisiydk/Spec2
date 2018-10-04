Class {
	#name : #SpValueHolderTests,
	#superclass : #TestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #tests }
SpValueHolderTests >> testAcceptingValue [

	| point holder |
	point := 2@3.
	holder := point aspect x useSlot asValueHolder.
	
	holder value: 10.
	self assert: point x equals: 2.
	
	holder acceptValue.
	self assert: point x equals: 10
]

{ #category : #tests }
SpValueHolderTests >> testAcceptingValueWhenReadOnlyAspect [

	| point holder |
	point := 2@3.
	holder := point aspect x useSlot readOnly asValueHolder.
	
	holder value: 10.
	self assert: point x equals: 2.
	
	holder acceptValue.
	self assert: point x equals: 2
]

{ #category : #tests }
SpValueHolderTests >> testBuildingPropertyAspectFromValue [

	| holder newAspect |
	holder := (2@3) aspect itself asValueHolder.

	newAspect := holder aspect x build.
	
	self assert: newAspect class equals: SpObjectPropertyAspect.	
	self assert: newAspect object equals: 2@3.
	self assert: newAspect readValue equals: 2
]

{ #category : #tests }
SpValueHolderTests >> testBuildingSimpleAspectFromValue [

	| holder newAspect |
	holder := (2@3) aspect itself asValueHolder.

	newAspect := holder aspect itself build.
	
	self assert: newAspect class equals: SpSimpleValueAspect.	
	self assert: newAspect value equals: 2@3
]

{ #category : #tests }
SpValueHolderTests >> testCheckingInvalidValue [

	| point holder |
	point := 2@3.
	holder := point aspect x 
		useSlot;
		restriction: (SpNumberRestriction minValue: 1 maxValue: 10); 
		asValueHolder.
	
	holder value: 20.
	
	self deny: holder isValid
]

{ #category : #tests }
SpValueHolderTests >> testCheckingValidValue [

	| point holder |
	point := 2@3.
	holder := point aspect x 
		useSlot;
		restriction: (SpNumberRestriction minValue: 1 maxValue: 10); 
		asValueHolder.
	
	holder value: 5.
	
	self assert: holder isValid
]

{ #category : #tests }
SpValueHolderTests >> testConvertingToTextValueHolder [

	| holder textHolder |
	holder := (1@3) aspect x asValueHolder.
	textHolder := holder asTextValueHolder.
	
	self assert: textHolder class equals: SpPrintedValueHolder.
	self assert: textHolder baseValueHolder equals: holder.
	self assert: textHolder stringConverter equals: holder valueAspect stringConverter
]

{ #category : #tests }
SpValueHolderTests >> testGettingName [

	| holder |
	holder := ((1@3) aspect x name: 'aspect name') asValueHolder.
	
	self assert: holder name equals: 'aspect name'
]

{ #category : #tests }
SpValueHolderTests >> testHasNoUnacceptedValueWhenValueWasAccepted [

	| point holder |
	point := 2@3.
	holder := point aspect x useSlot autoAcceptValues asValueHolder.
	
	holder value: 10.
	
	self deny: holder hasUnacceptedValue
]

{ #category : #tests }
SpValueHolderTests >> testHasUnacceptedValueWhenItIsDifferentThanInAspect [

	| point holder |
	point := 2@3.
	holder := point aspect x useSlot asValueHolder.
	
	holder value: 10.
	
	self assert: holder hasUnacceptedValue
	
]

{ #category : #tests }
SpValueHolderTests >> testIsOptionalCheck [

	| holder |
	holder := (1@3) aspect x asValueHolder.
	
	self deny: holder isOptional.
	
	holder valueAspect optional.
	self assert: holder isOptional.
]

{ #category : #tests }
SpValueHolderTests >> testIsReadOnly [

	| point holder |
	point := 2@3.
	holder := point aspect x useSlot asValueHolder.
	
	self deny: holder isReadOnly.
	
	holder valueAspect readOnly.
	self assert: holder isReadOnly. 
	
]

{ #category : #tests }
SpValueHolderTests >> testSettingInvalidValue [

	| point holder |
	point := 2@3.
	holder := point aspect x 
		useSlot;
		restriction: (SpNumberRestriction minValue: 1 maxValue: 10); 
		asValueHolder.
	
	holder value: 20.
	
	self assert: point x equals: 2.
	self assert: holder value equals: 20
]

{ #category : #tests }
SpValueHolderTests >> testSettingInvalidValueInAutoAcceptMode [

	| point holder |
	point := 2@3.
	holder := point aspect x 
		useSlot;
		restriction: (SpNumberRestriction minValue: 1 maxValue: 10); 
		autoAcceptValues;
		asValueHolder.
	
	holder value: 20.
	
	self assert: point x equals: 2.
	self assert: holder value equals: 20
]

{ #category : #tests }
SpValueHolderTests >> testSettingInvalidValueShouldAnnounceValueChanged [

	| point holder announced |
	announced := false.
	point := 2@3.
	holder := point aspect x 
		useSlot;
		restriction: (SpNumberRestriction minValue: 1 maxValue: 10); 
		asValueHolder.
	holder whenChangedDo: [ announced := true ].
	
	holder value: 20.
	
	self assert: announced
]

{ #category : #tests }
SpValueHolderTests >> testSettingNewValue [

	| point holder |
	point := 2@3.
	holder := point aspect x useSlot asValueHolder.
	
	holder value: 10.
	
	self assert: holder value equals: 10.
	self assert: point x equals: 2.
	
]

{ #category : #tests }
SpValueHolderTests >> testSettingNewValueInAutoAcceptMode [

	| point holder |
	point := 2@3.
	holder := point aspect x useSlot autoAcceptValues asValueHolder.
	
	holder value: 10.
	
	self assert: point x equals: 10.
	self assert: holder value equals: 10
]
