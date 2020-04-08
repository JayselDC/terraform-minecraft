# terraform-minecraft
## Overview
This repository is a Google Cloud Platform (GCP) Minecraft server allowing the creation of *reusable infrastructure* such as a virtual machine that will host a Minecraft server.

## Pre-requisites
* Terraform v0.12.24
* GCP Account
* SSH

## Features
* Automatic world backups in cloud storage
* Automatic server startup on when vm instance is started
* Ephemeral public IPs to save costs
* Pre-emptible vm instances to save costs
* Mod ready