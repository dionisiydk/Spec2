instance creation
buttonOn: aBlock named: commandName

	^self buttonOn: (aBlock asSpecCommand: commandName)