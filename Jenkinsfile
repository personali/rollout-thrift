#!/usr/bin/env groovy
node {
    checkout scm
    withEnv(['PATH+EXTRA=$PATH:/usr/local/bin']) {
        withMaven(jdk: '1.8', maven: '3.5.0') {
                sh "rvm use --ruby-version 2.4"
                sh "make"
        }
    }
}
