#!/bin/bash

app_home='/path/to'

# Define the directory path where the log file is located
LOG_DIR(){
    local dir="$1"

    LOG_OUT="$app_home/$dir/nohupclear.log"

    # Define the log file names
    NOHUP_FILES=("clearfile.out" "clear_file.out")  

    # Loop through each log file
    for CHECK in "${NOHUP_FILES[@]}"; do
        # Combine directory path and filename
        NOHUP_PATH="$app_home/$dir/$CHECK"
        
        # Check if the log file exists
        if [ -f "$NOHUP_PATH" ]; then
            # Truncate the log file
            cat /dev/null > "$NOHUP_PATH"
            echo "$(date '+%Y-%m-%d %H:%M:%S') - Contents of $NOHUP_PATH cleared." >> "$LOG_OUT"
        else
            echo "$(date '+%Y-%m-%d %H:%M:%S') - Log file $NOHUP_PATH not found." >> "$LOG_OUT"
        fi
    done
}

LOG_DIR "folder where file to be cleared is located"
LOG_DIR "folder where file to be cleared is located"
LOG_DIR "folder where file to be cleared is located"
