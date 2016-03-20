import com.project.frs.Role
import com.project.frs.UserRole
import com.project.frs.Customer
import com.project.frs.Clerk

class BootStrap {

    def init = { servletContext ->		
		def customer = new Customer(email:"",
								password: "123qwe!@#",
								username: "customer",
								firstName: "",
								lastName: "",
								contactNo: "",
								birthdate: "June",
								address: "",
								enabled: true,
								accountExpired: false,
								accountLocked: false,
								passwordExpired: false)
			customer.save(flush: true)
			def role = new Role(authority: 'ROLE_CUSTOMER').save(flush: true)
			UserRole.create customer, role
			
			def cashier = new Clerk(email:"",
								password: "123qwe!@#",
								username: "bean",
								firstName: "mrBean",
								lastName: "Teddy",
								contactNo: "",
								birthdate: "",
								address: "",
								enabled: true,
								accountExpired: false,
								accountLocked: false,
								passwordExpired: false)
			cashier.save(flush: true)
			def role1 = new Role(authority: 'ROLE_CASHIER').save(flush: true)
			UserRole.create cashier, role1
			
			def admin = new Clerk(email:"",
								password: "123qwe!@#",
								username: "admin",
								firstName: "",
								lastName: "",
								contactNo: "",
								birthdate: "",
								address: "",
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
