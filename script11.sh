
#!/bin/bash
#Q2
# Step 1: Get the username of the last logged-in user
last_user=$(last -n 1 | awk 'NR==1{print $1}')

# Step 2: Find files owned by the last logged-in user in the home directory
files=$(find /home -maxdepth 2 -user "$last_user")

# Step 3: Calculate total login time of the user
total_login_time=$(last "$last_user" | awk '{total += $(NF-2)} END {print total}')


