styles-default
setUpDefaultStyle
	<styleSpec>
	
	ui layout: self with: [ :layout | 
		layout beFlow vertical.
		
		fields do: [ :each |
			layout add: each with: [ :c | 
				c margin: 6@6.
				c horizontal matchParent.
				c vertical fitContent]]
	]