events
safeUIEventHandlerFrom: handlerBlock

	^[
		handlerBlock on: Error fork: [ :err | err pass ]
	]