opening
openInVerticalPopup: aPresenter over: parentMorph with: popupInitBlock
	
	| popup |
	popup := SpPopupMorph with: aPresenter.	
	popupInitBlock value: popup.
	
	popup openVerticalOver: parentMorph