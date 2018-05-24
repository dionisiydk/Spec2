tests
testConvertsCommandModelToActivator

	self assert: presenter model class equals: CmdCommandActivator.
	self assert: presenter model activationStrategy class equals: CmdManualActivationStrategy.