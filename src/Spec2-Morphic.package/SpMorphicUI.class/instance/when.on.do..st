events
when: anUIEvent on: aMorph do: handlerBlock
	
	aMorph onSpecUIEvent: anUIEvent send: #value to: (self safeUIEventHandlerFrom: handlerBlock)