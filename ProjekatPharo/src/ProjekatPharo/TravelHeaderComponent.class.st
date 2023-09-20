Class {
	#name : #TravelHeaderComponent,
	#superclass : #WAComponent,
	#instVars : [
		'component'
	],
	#category : #ProjekatPharo
}

{ #category : #'instance creation' }
TravelHeaderComponent class >> from: aComponent [
	^self new component: aComponent;
	yourself 
]

{ #category : #accessing }
TravelHeaderComponent >> component [
	^component
]

{ #category : #accessing }
TravelHeaderComponent >> component: anObject [
	component := anObject 
]

{ #category : #rendering }
TravelHeaderComponent >> renderAdminButtonOn: html [ 
	html form: [ 
		html tbsNavbarButton 
			tbsPullRight;
			callback: [ component goToAdministrationView ];
			with: [ 
				html tbsGlyphIcon iconListAlt. 
				html text: 'Admin view' ] ]
]

{ #category : #rendering }
TravelHeaderComponent >> renderBrandOn: html [
	html tbsNavbarHeader: [ 
		html tbsNavbarBrand url: self application url; with: 'TravelBlog' ]
]

{ #category : #rendering }
TravelHeaderComponent >> renderButtonsOn: html [ 
	self session isLogged
		ifTrue: [ self renderAdminButtonOn: html ]
		ifFalse: [ self renderModalLoginButtonOn: html ]

]

{ #category : #rendering }
TravelHeaderComponent >> renderContentOn: html [
	html tbsNavbar beDefault ; with: [ 
		html tbsContainer: 
			[ self renderBrandOn: html.
			  self renderButtonsOn: html
			]
	 ]
]

{ #category : #rendering }
TravelHeaderComponent >> renderModalLoginButtonOn: html [ 
	html render: (TravelBAuthentificationComponent from: component).
	html tbsNavbarButton
		tbsPullRight;
		attributeAt: 'data-target' put: '#myAuthDialog';
		attributeAt: 'data-toggle' put: 'modal';
		with: [
			html tbsGlyphIcon iconLock.
			html text: ' Login' ]

]
