User.create(userName: 'admin',
            email: 'admin@admin.com',
            password_digest: BCrypt::Password.create('admin'),
            role: 'ADMIN')
