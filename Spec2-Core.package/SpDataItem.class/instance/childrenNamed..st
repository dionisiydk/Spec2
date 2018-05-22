accessing
childrenNamed: aSymbol

	^children detect: [ :each | each name = aSymbol ]