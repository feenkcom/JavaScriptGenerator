Extension { #name : #Float }

{ #category : #'*JavaScriptGenerator' }
Float >> writeLinkLanguageOn: aStream [
	self isNaN
		ifTrue: [ 
			('float' asJSGIdentifier callWith: { 'nan' asJSGString })
				writeLinkLanguageOn: aStream.
			^ self ].
	
	self printOn: aStream
]
