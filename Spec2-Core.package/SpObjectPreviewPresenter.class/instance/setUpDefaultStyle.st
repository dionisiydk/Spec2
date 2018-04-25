styles-default
setUpDefaultStyle
	<styleSpec>
	
	ui layout: self with: [ :layout | 
		layout beFlow horizontal.
		layout add: displayPresenter with: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ].
		detailsPresenter ifNotNil: [ self layoutDetailsOn: layout].
	]