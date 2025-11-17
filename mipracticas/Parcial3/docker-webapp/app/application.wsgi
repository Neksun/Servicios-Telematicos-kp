#!/usr/bin/python3
import sys, os

# Asegura que Apache encuentre el paquete webapp
sys.path.insert(0, "/var/www/webapp")

# Tu aplicación Flask está en run.py y se llama "app"
from run import app as application
