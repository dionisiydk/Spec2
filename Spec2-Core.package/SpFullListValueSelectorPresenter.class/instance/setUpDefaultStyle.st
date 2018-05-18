styles-default
setUpDefaultStyle
	<styleSpec>
	
	ui layout: self with: [ :layout | 
		layout beFlow horizontal.
		layout add: optionPresenter with: [ :c | 
			c horizontal matchParent.
			c vertical matchParent]
	]