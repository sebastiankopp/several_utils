#!/bin/sh

# Simple Password Generator

uuidgen | tr -d '\n' | tr -d '-' | xxd -r -p | base64 | tr '/' '-' | tr -d '='
