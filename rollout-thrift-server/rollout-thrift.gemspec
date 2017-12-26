$:.push File.expand_path("../lib", __FILE__)
$:.push File.expand_path("../lib/rollout-thrift/thrift", __FILE__)

#puts "thrift --gen rb -out lib/rollout-thrift/thrift ../rollout-thrift.thrift"

Gem::Specification.new do |s|
    s.name        = "rollout-thrift"
    s.version     = "0.0.1" 
    s.authors     = ["Amir Bilu"]
    s.email       = ["amirbilu@gmail.com"]
    s.description = "Thrift server for rollout"
    s.summary     = "Thrift server for rollout"
    s.homepage    = "https://github.com/personali/rollout-thrift"
    s.license     = "MIT"

    #s.files         = `git ls-files`.split("\n")
    #s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
    #s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
    s.require_paths = ["lib"]

    s.add_dependency "thrift", "~> 0.10.0"
    s.add_dependency "rack", "~> 1.5"
    s.add_dependency "thin", "~> 1.5"
    s.add_dependency "rollout", "~> 2.4"
    s.add_dependency "redis", "~> 4.0"
end

