import sys
import csv

with open('input/request.csv') as f:
    reader = csv.DictReader(f)

    for row in reader:
        if row["firewall"] == "false":
            print("Validation failed: Firewall disabled")
            sys.exit(1)

print("Validation passed")
