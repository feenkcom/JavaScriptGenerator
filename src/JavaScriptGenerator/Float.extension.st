Extension { #name : #Float }

{ #category : #'*JavaScriptGenerator' }
Float >> writeJavaScriptOn: aStream [
	self isNaN
		ifTrue: [ 
			('float' asJSGIdentifier jsCallWith: { 'nan' asJSGString })
				writeJavaScriptOn: aStream.
			^ self ].
	
	self printOn: aStream
]
