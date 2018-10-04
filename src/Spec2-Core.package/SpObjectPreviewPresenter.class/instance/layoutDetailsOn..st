styles-default
layoutDetailsOn: aLayout

	| button |
	button := SpCommandPresenter buttonOn: [ self openDetails ] named: '...'.
	
	aLayout add: button with: [ :c | 
		c horizontal fitContent.
		c vertical fitContent ]