instance creation
buttonOn: aBlock named: commandName iconName: iconName

	^self buttonOn: (aBlock asSpecCommand: commandName iconName: iconName)