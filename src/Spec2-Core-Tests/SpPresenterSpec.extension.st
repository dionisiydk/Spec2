Extension { #name : #SpPresenterSpec }

{ #category : #'*Spec2-Core-Tests' }
SpPresenterSpec >> forStubUI [
	"Pragma <forStubUI> is used to mark view and style specs to be only used in Spec tests.
	Spec tests use stub implementation of user interface, SpStubUI"
	
	self backendUI: SpStubUI
]