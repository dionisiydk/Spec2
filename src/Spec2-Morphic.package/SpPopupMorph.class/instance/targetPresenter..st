accessing
targetPresenter: aPresenter
	targetPresenter := aPresenter.
	targetPresenter view	
		hResizing: #spaceFill;
		vResizing: #spaceFill.	
	self addMorphBack: targetPresenter view