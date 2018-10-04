Class {
	#name : #SpSmartNumberDecorationTests,
	#superclass : #SpTextDecorationTestCase,
	#category : 'Spec2-Core-Tests-Tests'
}

{ #category : #running }
SpSmartNumberDecorationTests >> createTextDecoration [
	^SpSmartNumberDecoration new
]

{ #category : #tests }
SpSmartNumberDecorationTests >> testConvertingDecoratedPositionToNative [
	
	| actual |
	actual := decoration convertDecoratedPosition: 3 toNativeOn: '10 000'.
	
	self assert: actual equals: 2
]

{ #category : #tests }
SpSmartNumberDecorationTests >> testConvertingDecoratedPositionToNative2 [
	
	| actual |
	actual := decoration convertDecoratedPosition: 6 toNativeOn: '10 0 00'.
	
	self assert: actual equals: 4
]

{ #category : #tests }
SpSmartNumberDecorationTests >> testConvertingDecoratedPositionToNativeWhenItBeforeSeparator [
	
	| actual |
	actual := decoration convertDecoratedPosition: 6 toNativeOn: '10 000 000'.
	
	self assert: actual equals: 5
]

{ #category : #tests }
SpSmartNumberDecorationTests >> testConvertingDecoratedPositionToNativeWhenItIsEndOfText [
	
	| actual |
	actual := decoration convertDecoratedPosition: 6 toNativeOn: '10 000'.
	
	self assert: actual equals: 5
]

{ #category : #tests }
SpSmartNumberDecorationTests >> testConvertingDecoratedPositionToNativeWhenItIsStartOfText [
	
	| actual |
	actual := decoration convertDecoratedPosition: 0 toNativeOn: '10 000'.
	
	self assert: actual equals: 0
]

{ #category : #tests }
SpSmartNumberDecorationTests >> testConvertingDecoratedTextToNative [
	
	| actual |
	actual := decoration convertDecoratedTextToNative: '10 00 0'.
	
	self assert: actual equals: '10000'
]

{ #category : #tests }
SpSmartNumberDecorationTests >> testConvertingNativePositionToDecorated [
	
	| actual |
	actual := decoration convertNativePosition: 3 toDecoratedOn: '10 000'.
	
	self assert: actual equals: 4
]

{ #category : #tests }
SpSmartNumberDecorationTests >> testConvertingNativePositionToDecorated2 [
	
	| actual |
	actual := decoration convertNativePosition: 4 toDecoratedOn: '10 0 00'.
	
	self assert: actual equals: 6
]

{ #category : #tests }
SpSmartNumberDecorationTests >> testConvertingNativePositionToDecoratedWhenItIsOutOfBounds [
	
	| actual |
	actual := decoration convertNativePosition: 10 toDecoratedOn: '10 000'.
	
	self assert: actual equals: '10 000' size
]

{ #category : #tests }
SpSmartNumberDecorationTests >> testConvertingNativePositionToDecoratedWhenItIsStartOfText [
	
	| actual |
	actual := decoration convertNativePosition: 0 toDecoratedOn: '10 000'.
	
	self assert: actual equals: 0
]

{ #category : #tests }
SpSmartNumberDecorationTests >> testDecoratingEmptyText [
	
	| actual |
	actual := decoration convertNativeTextToDecorated: ''.
	
	self assert: actual equals: ''
]

{ #category : #tests }
SpSmartNumberDecorationTests >> testDecoratingInsertion [
	
	| decoratedInsertion nativeInsertion |
	nativeInsertion := '10 000' copyReplaceFrom: 4 to: 3 with: '9'.
	self assert: nativeInsertion equals: '10 9000'.
	
	decoratedInsertion := decoration decorateInsertionOf: '9' into: '10 000' from: 4 to: 3.
	
	self assert: decoratedInsertion equals: '109 000'.
]

{ #category : #tests }
SpSmartNumberDecorationTests >> testDecoratingTextWhichEndsWithDecimalSeparator [
	
	| actual |
	actual := decoration convertNativeTextToDecorated: '10000.'.
	
	self assert: actual equals: '10 000.'
]

{ #category : #tests }
SpSmartNumberDecorationTests >> testDecoratingTextWithDecimalPartWithCommaSeparator [
	
	| actual |
	actual := decoration convertNativeTextToDecorated: '10000,2345'.
	
	self assert: actual equals: '10 000,2345'
]

{ #category : #tests }
SpSmartNumberDecorationTests >> testDecoratingTextWithDecimalPartWithPeriodSeparator [
	
	| actual |
	actual := decoration convertNativeTextToDecorated: '10000.2345'.
	
	self assert: actual equals: '10 000.2345'
]

{ #category : #tests }
SpSmartNumberDecorationTests >> testDecoratingTextWithOneThousandthGroup [
	
	| actual |
	actual := decoration convertNativeTextToDecorated: '10000'.
	
	self assert: actual equals: '10 000'
]

{ #category : #tests }
SpSmartNumberDecorationTests >> testDecoratingTextWithTwoThousandthGroups [
	
	| actual |
	actual := decoration convertNativeTextToDecorated: '10123000'.
	
	self assert: actual equals: '10 123 000'
]

{ #category : #tests }
SpSmartNumberDecorationTests >> testDecoratingTextWithoutThousands [
	
	| actual |
	actual := decoration convertNativeTextToDecorated: '10'.
	
	self assert: actual equals: '10'
]

{ #category : #tests }
SpSmartNumberDecorationTests >> testHasThousandsSeparatorByDefault [
	
	self assert: decoration thousandsSeparator equals: ' '
]
