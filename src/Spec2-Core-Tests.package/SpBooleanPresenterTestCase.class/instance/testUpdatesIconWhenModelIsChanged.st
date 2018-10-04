tests
testUpdatesIconWhenModelIsChanged

	| currentIcon newIcon |
	currentIcon := presenter children anyOne model.
	
	presenter model value: false.
	newIcon := presenter children anyOne model.
	
	self deny: newIcon = currentIcon