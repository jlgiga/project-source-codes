package com.project.frs

class Route {
	String origin
	String destination
	BigDecimal amount
	
	static hasMany = [flight:Flight]
	
    static constraints = {
		origin(validator: { val, obj ->
		   if (val == obj.properties['destination']) {
			  return 'validator.message'
		   }
		}, blank: false, inList: ['Bacolod', 'Basco(Batanes)', 'Busuanga(Coron)', 'Butuan', 'Cagayan de Oro', 'Calbayog', 'Catarman', 'Caticlan (Boracay)', 'Cebu', 'Clark', 'Cotabato', 'Davao', 'Dipolog', 'Dumaguete', 'General Santos', 'Iloilo', 'Jolo', 'Kalibu', 'Kuala Lumpur', 'Laoag', 'Legaspi', 'Manila', 'Masbate', 'Naga', 'Ozamiz', 'Pagadian', 'Puerto Prinsesa', 'Roxas', 'Sandakan', 'San Jose (Mindoro)', 'Surigao', 'Tacloban', 'Tagbilaran (Bohol)', 'Tawi-Tawi', 'Tuguegarao', 'Zamboanga'])
		destination blank: false, inList: ['Bacolod', 'Basco(Batanes)', 'Busuanga(Coron)', 'Butuan', 'Cagayan de Oro', 'Calbayog', 'Catarman', 'Caticlan (Boracay)', 'Cebu', 'Clark', 'Cotabato', 'Davao', 'Dipolog', 'Dumaguete', 'General Santos', 'Iloilo', 'Jolo', 'Kalibu', 'Kuala Lumpur', 'Laoag', 'Legaspi', 'Manila', 'Masbate', 'Naga', 'Ozamiz', 'Pagadian', 'Puerto Prinsesa', 'Roxas', 'Sandakan', 'San Jose (Mindoro)', 'Surigao', 'Tacloban', 'Tagbilaran (Bohol)', 'Tawi-Tawi', 'Tuguegarao', 'Zamboanga']
		amount blank: false, min: 500.00
    }
	
	String toString() {
		"${origin}-${destination}"
	}
}
