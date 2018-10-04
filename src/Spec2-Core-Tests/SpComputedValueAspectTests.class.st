Class {
	#name : #SpComputedValueAspectTests,
	#superclass : #SpValueAspectTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #helpers }
SpComputedValueAspectTests >> aspectExample [
	^SpComputedValueAspect block: [ 2*3 ]
]

{ #category : #tests }
SpComputedValueAspectTests >> testCreationByBuilder [
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	| block |
	block := ['some computed value'].
	aspect := block aspect build.
	
	self assert: aspect class equals: SpComputedValueAspect.
	self assert: aspect block == block.
	self assert: aspect name equals: 'noname'.
	self assert: aspect isOptional equals: false.
	self assert: aspect stringConverter notNil
]

{ #category : #tests }
SpComputedValueAspectTests >> testIsReadOnlyByDefault [

	aspect := SpComputedValueAspect new.
	
	self assert: aspect isReadOnly
]

{ #category : #tests }
SpComputedValueAspectTests >> testReadingValue [
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	
	aspect := [1 + 3] aspect build.
	
	self assert: aspect readValue equals: 4
]
