events
when: anUIEvent on: aMorph do: handlerBlock
	
	aMorph on: anUIEvent morphicName send: #value to: (self safeUIEventHandlerFrom: handlerBlock)