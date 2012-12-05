
module PlazrAuth
  puts 'Creating default Roles'

  ['admin', 'user'].each do |role|
    Role.find_or_create_by_name(role)
  end

end
