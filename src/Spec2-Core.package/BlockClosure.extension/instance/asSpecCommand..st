*Spec2-Core
asSpecCommand: commandName
	^SpPluggableCommand new
		block: self;
		name: commandName