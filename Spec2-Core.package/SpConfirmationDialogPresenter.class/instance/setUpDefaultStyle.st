styles-default
setUpDefaultStyle
	<styleSpec>
	
	ui layout: self with: [ :layout | 
		layout beFlow vertical.
		layout padding: 6@6.
		layout alignCenter.
		
		layout add: title with: [ :c |
			c horizontal fitContent.
			c vertical fitContent].
		layout add: model with: [ :c | 
			c margin: 6@6.
			c horizontal matchParent.
			c vertical matchParent ].
		layout add: toolbar with: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ].
 ]