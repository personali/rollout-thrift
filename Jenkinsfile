#!/usr/bin/env groovy
node {
    checkout scm
    withEnv(['PATH+EXTRA=$PATH:/usr/local/bin:/bin:/usr/bin']) {
        withMaven(jdk: '1.8', maven: '3.5.0') {
            rvm "make"
        }
    }
}

def rvm(String commands) {
    sh "bash -c 'source ~/.rvm/scripts/rvm && gem install bundler && ${commands}'"
}
