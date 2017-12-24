java: build-ruby-server build-java-client	

build-ruby-server:
	bundle --gemfile=rollout-thrift-server/Gemfile

build-java-client:
	mvn -f rollout-thrift-client-java/pom.xml clean install

run:
	export=BUNDLE_BIN_PATH=$(pwd)/rollout-thrift-server/bin &&  bundle exec rollout-thrift
