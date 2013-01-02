
module PlazrAuth
  puts 'Creating default Roles'

  ['root', 'admin', 'staff', 'user'].each do |role|
    Role.find_or_create_by_name(role)
  end

end
