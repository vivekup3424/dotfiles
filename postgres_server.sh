#!/bin/bash

# Check if PostgreSQL service is active
if systemctl is-active --quiet postgresql; then
    echo "PostgreSQL server is active."
    
    # Retrieve PostgreSQL socket address
    SOCKET=$(sudo netstat -tlnp | grep postgres | awk '{print $4}')
    echo "PostgreSQL socket address: $SOCKET"
else
    echo "PostgreSQL server is not active."
fi

