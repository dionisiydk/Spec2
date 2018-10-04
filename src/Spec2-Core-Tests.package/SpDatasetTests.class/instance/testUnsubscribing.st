tests
testUnsubscribing
	
	dataset whenChangedSend: #value to: self.
	self assert: (dataset hasSubscriber: self).
	
	dataset unsubscribe: self.
	
	self deny: (dataset hasSubscriber: self)