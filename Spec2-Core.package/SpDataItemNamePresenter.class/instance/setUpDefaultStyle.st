styles-default
setUpDefaultStyle
	<styleSpec>
	
	ui layout: self with: [ :layout |
		layout beFlow horizontal; alignCenter.

		layout add: itemNamePresenter with: [ :c |
			c vertical fitContent ]
	 ]