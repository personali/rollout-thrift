build: build-ruby-server build-java-client	

build-ruby-server:
	rollout-thrift-server/bin/gen-thrift
	bundle --gemfile=rollout-thrift-server/Gemfile

build-java-client:
	mvn -f rollout-thrift-client-java/pom.xml clean install

start:
	 cd rollout-thrift-server && bundle exec bin/rollout-thrift --port 9090
