# Create initial admin user
admin = User.create(email: 'admin@admin.com', password: 'password', name: 'Admin')

# Create user and admin roles
admin_role = Role.create(name: 'Admin')
user_role = Role.create(name: 'User')

# Assign role to initial admin user
admin.role = admin_role
admin.save
