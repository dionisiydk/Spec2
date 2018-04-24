opening
openModal: aPresenter with: anInitBlock

	| modalContainer |
	modalContainer := SpModalMorph new.	
	modalContainer addMorphBack: aPresenter view.
	anInitBlock value: modalContainer.
	
	"Instead of World it should be morphic #modalMorph"
	World openModal: modalContainer