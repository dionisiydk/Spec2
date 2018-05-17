styles-default
setUpDefaultStyle
	<styleSpec>
	
	ui layout: self with: [ :layout | 
		layout beFlow horizontal.
		layout add: optionsPresenter with: [ :c | 
			c horizontal matchParent.
			c vertical matchParent]
	]