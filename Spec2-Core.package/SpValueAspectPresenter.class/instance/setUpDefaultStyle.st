styles-default
setUpDefaultStyle
	<styleSpec>
	
	ui layout: self with: [ :layout | 
		layout beFlow horizontal.
		
		layout add: namePresenter with: [ :c | c vertical fitContent].
		layout add: valuePresenter with: [ :c | 
			c vertical fitContent.
			c horizontal matchParent].
	]