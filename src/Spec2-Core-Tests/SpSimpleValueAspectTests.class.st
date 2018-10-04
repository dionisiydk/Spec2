Class {
	#name : #SpSimpleValueAspectTests,
	#superclass : #SpValueAspectTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #helpers }
SpSimpleValueAspectTests >> aspectExample [
	^SpSimpleValueAspect of: 'some value'
]

{ #category : #tests }
SpSimpleValueAspectTests >> testCreationByBuilder [
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	
	aspect := 'some string' aspect itself build.
	
	self assert: aspect class equals: SpSimpleValueAspect.
	self assert: aspect value equals: 'some string'.
	self assert: aspect name equals: 'noname'.
	self assert: aspect isOptional equals: false.
	self assert: aspect stringConverter notNil
]

{ #category : #tests }
SpSimpleValueAspectTests >> testReadingValue [
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	
	aspect := 'some string' aspect itself build.
	
	self assert: aspect readValue equals: 'some string'
]

{ #category : #tests }
SpSimpleValueAspectTests >> testWritingValue [
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	
	aspect := 'some string' aspect itself build.
	
	aspect writeValue: 'new value'.
	
	self assert: aspect readValue equals: 'new value'
]
