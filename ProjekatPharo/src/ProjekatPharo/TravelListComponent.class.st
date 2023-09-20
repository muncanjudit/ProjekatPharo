Class {
	#name : #TravelListComponent,
	#superclass : #TravelBScreenComponent,
	#instVars : [
		'showLoginError'
	],
	#category : #ProjekatPharo
}

{ #category : #'as yet unclassified' }
TravelListComponent >> goToAdministrationView [
	self call: TravelAdminComponent new
]

{ #category : #'as yet unclassified' }
TravelListComponent >> hasLoginError [ 
	^ showLoginError ifNil: [ false ]

]

{ #category : #'as yet unclassified' }
TravelListComponent >> loginErrorMessage [
	^ 'Incorrect login and/or password'

]

{ #category : #'as yet unclassified' }
TravelListComponent >> loginErrorOccurred [ 
	showLoginError := true
]

{ #category : #'as yet unclassified' }
TravelListComponent >> renderContentOn: html [
	super renderContentOn: html.
	self renderLoginErrorMessageIfAnyOn: html.
	html tbsContainer: [ 
		self blog allVisibleBlogPosts do: 
			[ :p | html render: (TravelBPostComponent new post: p) 
		]]
	
]

{ #category : #rendering }
TravelListComponent >> renderLoginErrorMessageIfAnyOn: html [ 
	self hasLoginError ifTrue: [
		showLoginError := false.
		html tbsAlert
			beDanger;
			with: self loginErrorMessage ]
]

{ #category : #'as yet unclassified' }
TravelListComponent >> tryConnectionWithLogin: login andPassword: password [
	(login = self blog administrator login and: [
		(SHA256 hashMessage: password) = self blog administrator
	password ])
		ifTrue: [ 
			self session currentAdmin: self blog administrator.
			self goToAdministrationView ]
		ifFalse: [ self loginErrorOccurred ]
]
