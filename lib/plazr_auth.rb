require 'plazr_auth/engine'

module PlazrAuth
  Dir["#{PlazrAuth.root}/lib/*.rb"].each {|file| require file}
  #Dir["#{PlazrAuth.root}/lib/plazr_auth/models/*.rb"].each {|file| require file}
end
