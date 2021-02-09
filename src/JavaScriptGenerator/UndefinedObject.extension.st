Extension { #name : #UndefinedObject }

{ #category : #'*JavaScriptGenerator' }
UndefinedObject >> writeJavaScriptOn: aStream [
	aStream << 'null'
]
