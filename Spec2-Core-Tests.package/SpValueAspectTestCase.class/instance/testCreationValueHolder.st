tests
testCreationValueHolder
	| actual |
	aspect := self aspectExample.
	
	actual := aspect asValueHolder.
	
	self assert: actual class equals: SpValueHolder.
	self assert: actual valueAspect equals: aspect.
	self assert: actual value equals: aspect readValue