styles-default
setUpOneLineStyle
	<styleSpec>
	<forStyle: #oneLine>
	ui layout: self with: [ :layout | 
		layout beFlow horizontal.
		
		layout add: x with: [ :c | 
			c margin: 6@6.
			c horizontal matchParent.
			c vertical fitContent].
		layout add: y with: [ :c | 
			c margin: 6@6.
			c horizontal matchParent.
			c vertical fitContent].
		
	 ]