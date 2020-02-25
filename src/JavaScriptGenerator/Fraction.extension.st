Extension { #name : #Fraction }

{ #category : #'*JavaScriptGenerator' }
Fraction >> writeLinkLanguageOn: aStream [
	self asFloat writeLinkLanguageOn: aStream
]
