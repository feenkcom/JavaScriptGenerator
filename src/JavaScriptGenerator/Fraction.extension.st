Extension { #name : #Fraction }

{ #category : #'*JavaScriptGenerator' }
Fraction >> writeJavaScriptOn: aStream [
	self asFloat writeJavaScriptOn: aStream
]
