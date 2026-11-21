#!/bin/bash

helpers::log::info "Configuring Docker and UFW integration"

bash "$VIBRANIUM/setup-docker-ufw.sh"
