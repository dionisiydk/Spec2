accessing-selection
zapSelectionWith: newText
	"The main logic is copied from superclass and adopted for decoration and validation"
	| start stop decoratedText nativeStart decoratedEnd |
	start := self startIndex.
	stop := self stopIndex.
	(self validateModificationBy: newText) ifFalse: [ ^self ].	
	newText isEmpty ifTrue: [ self prepareEmphasisForTextDeletionFrom: start to: stop].

	decoratedText := self textDecoration 
		decorateInsertionOf: newText into: self text from: start to: stop - 1.
	
	textArea privateReplaceFrom: 1 to: self text size with: decoratedText asText.

	nativeStart := self textDecoration 
		convertDecoratedPosition: start toNativeOn: self text.
	decoratedEnd := self textDecoration 
		convertNativePosition: nativeStart + newText size - 1 toDecoratedOn: self text.
	self markIndex: start pointIndex: decoratedEnd + 1.
	self editingState previousInterval: self selectionInterval.
	self publishTextChanges