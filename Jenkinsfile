#!/usr/bin/env groovy
node {
    checkout scm
    withEnv(['PATH+EXTRA=$PATH:/usr/local/bin']) {
        withMaven(jdk: '1.8', maven: '3.5.0') {
                sh "source /usr/local/rvm/scripts/rvm"
                sh "make"
        }
    }
}
