styles-default
setUpRowStyle
	<styleSpec>
	<forStyle: #row>
	ui layout: self with: [ :layout | 
		layout beFlow horizontal.
		
		fields do: [ :each |
			layout add: each with: [ :c | 
				c margin: 6@6.
				c horizontal matchParent.
				c vertical fitContent]]
	]