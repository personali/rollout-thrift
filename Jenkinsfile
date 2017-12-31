#!/usr/bin/env groovy
node {
    checkout scm
    withEnv(['PATH+EXTRA=$PATH:/usr/local/bin']) {
        withMaven(jdk: '1.8', maven: '3.5.0') {
                sh "source ~/.rvm/scripts/rvm"
                sh "rvm --ruby-version use ruby-2.4.1"
                sh "make"
        }
    }
}
