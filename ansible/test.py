#!/usr/bin/python

import json
dictData = {
  "app": {
    "hosts": {
      "appserver": {
        "ansible_host": "34.77.35.66"
      }
    }
  },
  "db": {
    "hosts": {
      "dbserver": {
        "ansible_host": "34.76.95.110"
      }
    }
  }
}
jsonData = json.dumps(dictData)
with open("inventory.json", "w") as file:
    file.write(jsonData)
