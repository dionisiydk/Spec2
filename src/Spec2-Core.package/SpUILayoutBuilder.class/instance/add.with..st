composing presenters
add: childPresenter with: layoutBlock
 		
	presenter buildChild: childPresenter.
	
	self layoutChildView: childPresenter view with: layoutBlock.
	
	self addChildView: childPresenter view