accessing
childrenNamed: aSymbol

	^children detect: [ :each | each name = aSymbol ] ifNone: [ SpAbsentChildren instance ]