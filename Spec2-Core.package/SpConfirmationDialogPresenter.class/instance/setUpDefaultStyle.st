styles-default
setUpDefaultStyle
	<styleSpec>
	
	ui layout: self with: [ :layout | 
		layout beFlow vertical.
		
		layout add: model with: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].
		layout add: toolbar with: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ].
 ]