"
I define methods to allow easy access to Python 3 object's attributes.
"
Trait {
	#name : #JSGAttributeAccess,
	#category : #'JavaScriptGenerator-Traits'
}

{ #category : #'attribute access' }
JSGAttributeAccess >> => aString [
	"Shortcut for #attributeNamed:."
	^ self attributeNamed: aString
]

{ #category : #'attribute access' }
JSGAttributeAccess >> attributeNamed: aString [
	"Returns an instance of P3GAttributeAccess to access the attribute with aString as name."
	^ JSGAttributeReference target: self attributeIdentifier: aString asJSGIdentifier
]
