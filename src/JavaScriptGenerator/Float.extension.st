Extension { #name : #Float }

{ #category : #'*JavaScriptGenerator' }
Float >> writeJavaScriptOn: aStream [
	self isNaN
		ifTrue: [ 
			('float' asJSGIdentifier callWith: { 'nan' asJSGString })
				writeJavaScriptOn: aStream.
			^ self ].
	
	self printOn: aStream
]
