Gem::Specification.new do |s|
  s.name        = 'pub_sub'
  s.version     = '0.0.1'
  s.date        = '2020-04-17'
  s.summary     = "Redis pub-sub wrapper"
  s.authors     = ["Chris Marques"]
  s.email       = 'test.code.debug@gmail.com'
  s.files       = ["lib/pub_sub.rb"]

  s.add_dependency 'redis'
end
