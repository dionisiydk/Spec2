Class {
	#name : #SpNoTextDecorationTests,
	#superclass : #SpTextDecorationTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #running }
SpNoTextDecorationTests >> createTextDecoration [
	^SpNoTextDecoration new
]

{ #category : #tests }
SpNoTextDecorationTests >> testConvertingDecoratedPositionToNative [
	
	| actual |
	
	actual := decoration convertDecoratedPosition: 5 toNativeOn: 'some text'.
	self assert: actual equals: 5
]

{ #category : #tests }
SpNoTextDecorationTests >> testConvertingDecoratedTextToNative [
	
	| actual |
	
	actual := decoration convertDecoratedTextToNative: 'some text'.
	self assert: actual equals: 'some text'
]

{ #category : #tests }
SpNoTextDecorationTests >> testConvertingNativePositionToDecorated [
	
	| actual |
	
	actual := decoration convertNativePosition: 5 toDecoratedOn: 'some text'.
	self assert: actual equals: 5
]

{ #category : #tests }
SpNoTextDecorationTests >> testConvertingNativeTextToDecorated [
	
	| actual |
	
	actual := decoration convertNativeTextToDecorated: 'some text'.
	self assert: actual equals: 'some text'
]

{ #category : #tests }
SpNoTextDecorationTests >> testDecoratingInsertion [
	
	| actual |
	
	actual := decoration decorateInsertionOf: 'some string' into: '123456' from: 2 to: 4.
	
	self assert: actual equals: '1some string56'
]
