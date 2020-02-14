Extension { #name : #Symbol }

{ #category : #'*JavaScriptGenerator' }
Symbol >> <- aP3GGenerable [
	"Syntax sugar to make the DSL better."
	^ self asJSGIdentifier <- aP3GGenerable
]

{ #category : #'*JavaScriptGenerator' }
Symbol >> attributeNamed: aString [
	"Syntax sugar to make the DSL better."
	^ JSGAttributeReference target: self asJSGIdentifier attributeIdentifier: aString asJSGIdentifier
]

{ #category : #'*JavaScriptGenerator' }
Symbol >> call [
	"Syntax sugar to make the DSL better."
	^ self asJSGIdentifier call
]

{ #category : #'*JavaScriptGenerator' }
Symbol >> callWith: anArrayOrADictionary [
	"Syntax sugar to make the DSL better."
	^ self asJSGIdentifier callWith: anArrayOrADictionary
]

{ #category : #'*JavaScriptGenerator' }
Symbol >> callWith: anArray with: aDictionary [
	"Syntax sugar to make the DSL better."
	^ self asJSGIdentifier callWith: anArray with: aDictionary
]

{ #category : #'*JavaScriptGenerator' }
Symbol >> require [
	"Syntax sugar to make the DSL better."
	^ JSGRequire moduleNamed: self
]
