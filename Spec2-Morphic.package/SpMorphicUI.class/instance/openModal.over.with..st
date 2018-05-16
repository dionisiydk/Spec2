opening
openModal: aPresenter over: parentMorph with: anInitBlock

	| modalContainer |
	modalContainer := SpModalMorph new.	
	aPresenter view 
		hResizing: #spaceFill;
		vResizing: #spaceFill.
	modalContainer addMorphBack: aPresenter view.
	anInitBlock value: modalContainer.
	
	parentMorph openModal: modalContainer