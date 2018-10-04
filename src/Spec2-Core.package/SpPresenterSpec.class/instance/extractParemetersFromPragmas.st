initialization
extractParemetersFromPragmas
	
	definingMethod pragmas do: [ :each | 
		(self respondsTo: each keyword) ifTrue: [ each sendTo: self ]	
	]