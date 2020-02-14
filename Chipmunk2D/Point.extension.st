Extension { #name : #Point }

{ #category : #'*Chipmunk2D' }
Point >> asCpVector [
	^ CpVector fromPoint: self
]
