tests
testUnsubscribingObservers

	selection whenChangedSend: #value to: self.
	self assert: (selection hasSubscriber: self).
	
	selection unsubscribe: self.
	
	self deny: (selection hasSubscriber: self)