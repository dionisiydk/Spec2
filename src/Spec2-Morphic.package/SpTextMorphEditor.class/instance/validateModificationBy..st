accessing-selection
validateModificationBy: aText
	"The main logic is copied from superclass and adopted for decoration and validation"
	| start stop |
	start := self startIndex.
	stop := self stopIndex.
	(start = stop and: [ aText size = 0 ]) ifTrue: [ ^false].

	^self inputRestriction 
		validateInsertionOf: aText asString into: self nativeText asString
		from: (self textDecoration convertDecoratedPosition: start toNativeOn: self text) 
		to: (self textDecoration convertDecoratedPosition: stop - 1 toNativeOn: self text)