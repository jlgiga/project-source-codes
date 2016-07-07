import com.project.frs.Role
import com.project.frs.UserRole
import com.project.frs.Customer
import com.project.frs.Clerk

class BootStrap {

    def init = { servletContext ->		
		def customer = new Customer(email:"test@yahoo.com",
								password: "123qwe!@#",
								username: "customer",
								firstName: "Skipper",
								lastName: "Skipper",
								contactNo: "00000000000",
								birthdate: "September",
								address: "Hueco Mundo",
								enabled: true,
								accountExpired: false,
								accountLocked: false,
								passwordExpired: false)
			customer.save(flush: true)
			def role = new Role(authority: 'ROLE_CUSTOMER').save(flush: true)
			UserRole.create customer, role
			
			def cashier = new Clerk(email:"test@yahoo.com",
								password: "123qwe!@#",
								username: "bean",
								firstName: "mrBean",
								lastName: "Teddy",
								contactNo: "00000000000",
								birthdate: "September",
								address: "Hueco Mundo",
								enabled: true,
								accountExpired: false,
								accountLocked: false,
								passwordExpired: false)
			cashier.save(flush: true)
			def role1 = new Role(authority: 'ROLE_CASHIER').save(flush: true)
			UserRole.create cashier, role1
			
			def admin = new Clerk(email:"euniciamayeruiz@gmail.com",
								password: "123qwe!@#",
								username: "admin",
								firstName: "Skipper",
								lastName: "Skipper",
								contactNo: "00000000000",
								birthdate: "September",
								address: "Hueco Mundo",
								enabled: true,
								accountExpired: false,
								accountLocked: false,
								passwordExpired: false)
			admin.save(flush: true)
			def role2 = new Role(authority: 'ROLE_ADMIN').save(flush: true)
			UserRole.create admin, role2
    }
    def destroy = {
    }
}
