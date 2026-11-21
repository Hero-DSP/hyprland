#!/bin/bash

helpers::log::info "Installing WebApps"

vb-webapp-install \
  --own-profile \
  --category WebApp \
  --url 'mail.google.com/mail/u/0/#inbox' \
  --name Gmail \
  --icon gmail

vb-webapp-install \
  --own-profile \
  --category WebApp \
  --url 'outlook.com' \
  --name Outlook \
  --icon ms-outlook
