#!/usr/bin/env groovy
node {
    checkout scm
    withEnv(['PATH+EXTRA=$PATH:/usr/bin']) {
        withRvm('ruby-2.4.1') {
            withMaven(jdk: '1.8', maven: '3.5.0') {
                sh "make"
            }
        }
    }
}

def withRvm(version, cl) {
    withRvm(version, "executor-${env.EXECUTOR_NUMBER}") {
        cl()
    }
}

def withRvm(version, gemset, cl) {
    RVM_HOME = '$HOME/.rvm'
    paths = [
            "$RVM_HOME/gems/$version@$gemset/bin",
            "$RVM_HOME/gems/$version@global/bin",
            "$RVM_HOME/rubies/$version/bin",
            "$RVM_HOME/bin",
            "${env.PATH}"
    ]
    def path = paths.join(':')
    withEnv(["PATH=${env.PATH}:$RVM_HOME", "RVM_HOME=$RVM_HOME"]) {
        sh "set +x; source /var/lib/jenkins/.rvm/scripts/rvm; rvm use --create --install --binary $version@$gemset"
    }
    withEnv([
            "PATH=$path",
            "GEM_HOME=$RVM_HOME/gems/$version@$gemset",
            "GEM_PATH=$RVM_HOME/gems/$version@$gemset:$RVM_HOME/gems/$version@global",
            "MY_RUBY_HOME=$RVM_HOME/rubies/$version",
            "IRBRC=$RVM_HOME/rubies/$version/.irbrc",
            "RUBY_VERSION=$version"
    ]) {
        sh 'gem install bundler'
        cl()
    }
}

