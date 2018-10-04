*Spec2-Core
enableAllInView: aView forCommandsOf: aPresenter

	self allSubclassesDo: [ :each | 
		each enableInView: aView forCommandsOf: aPresenter ]