from datetime import datetime
import time

while True:
    with open("data/log.txt", "a") as f:
        log_message = f"log entry at {datetime.now()}\n"
        f.write(log_message)
        print(log_message.strip())  # Exibe no terminal
    time.sleep(1)