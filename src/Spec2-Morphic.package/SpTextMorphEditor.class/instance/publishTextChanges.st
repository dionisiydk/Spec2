accessing-selection
publishTextChanges
	self textMorph hasUnacceptedEdits ifTrue: [^self].
	
	self textMorph publishTextChanges