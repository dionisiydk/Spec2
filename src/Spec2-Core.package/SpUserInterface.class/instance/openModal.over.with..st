opening
openModal: aPresenter over: aView with: anInitBlock
	"aView is a parent view which will be blocked during modal dialog.
	anInit block should receive the modal view showing given aPresenter.
	This modal view should know how to #close dialog"
	self subclassResponsibility 