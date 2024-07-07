
#!/bin/bash

# Use find command to locate all conf.d files and iterate over each result
find /home/iteradmin/soumendra/Assignment -type f -name 'conf.d' | while read -r filepath; do
    # Replace '/' with '-' in the path
    new_filepath=$(echo "$filepath" | tr '/' '-')
    # Print the modified path
    echo "$new_filepath"
done

