# This documents contains detail instruction to automate OmopOnFHIR Project

## Overall Solution Architecture

## Hosted Runner Setup

### Create a folder in server where Hosted Runner will be installed

#### Download

$ mkdir actions-runner && cd actions-runner# Download the latest runner package

$ curl -o actions-runner-osx-x64-2.278.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.278.0/actions-runner-osx-x64-2.278.0.tar.gz

#### Extract the installer

$ tar xzf ./actions-runner-osx-x64-2.278.0.tar.gz

#### Configure

##### Create the runner and start the configuration experience

$ ./config.sh --url https://github.com/tarunchy/OmopOnFHIR --token ****(This can be retrived by clicking Settings->Actions->Runners->Add Self-Hosted runner)****

##### Last step, run it!

$ ./run.sh

#### Using self-hosted runner .github->workflow->pipeline.yaml file

##### Use this YAML in your workflow file for each job

runs-on: self-hosted

## Partial Automation of DB Setup

DB Setup is partially atuomated due licesning issue with different codes and vacculebary. Following Steps needs to be followed to configure database

### 1. Create Github Action Workflow

A Github action workflow is created which needs to be triggered manually. Its an once time activility which needs to be for first time before setting up workflow for web application

### 2. Execute workflow manullay from Github Action UI in Github.com

## Automation of Web application Build and Deployment

Web Application build and demployment to hosted runner server is fully automated with github action workflow pipeline. The job gets triggered based push of code to main or master branch or based on pull request approval and merge to main branch. 