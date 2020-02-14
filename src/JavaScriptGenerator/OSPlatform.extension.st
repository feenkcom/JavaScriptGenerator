Extension { #name : #OSPlatform }

{ #category : #'*JavaScriptGenerator' }
OSPlatform >> jsgJavaScriptPath [
	"Returns the path to the python3 executable as a String."
	^ self subclassResponsibility
]
