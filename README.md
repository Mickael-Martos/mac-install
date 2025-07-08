# mac-install
small script to install everything that is needed when setting up a new mac


# install python with homebrew and zsh
https://gist.github.com/josemarimanio/9e0c177c90dee97808bad163587e80f8


---

for my old mac:
- Disable Low Power Mode, enable High Power Mode
- Turn off animations in Dock settings
- Schedule auto-restarts via Terminal
- Clean up Login Items and Background Apps
- Monitor and manage RAM + use sudo purge
- Free up SSD space manually
- Disable iCloud sync for photos and other data-heavy apps
- ptimize Wi-Fi bands and disable slow network auto-join
- Re-index Spotlight for faster searches

https://naumanahmad86.medium.com/9-hidden-settings-to-make-your-mac-faster-again-d842c97c9baf

---

# Dashlane Raycast Setup for Multiple Macs

### Part 1: Configure Raycast

1.  Open Raycast on **both** Macs.
2.  Go to **Extensions** > **Dashlane**.
3.  In the extension preferences, set the **dcli Executable Path** to:
    ```
    /usr/local/bin/dcli
    ```

### Part 2: Configure your Intel Mac

*   No action is required. This setup is complete for your Intel-based Mac.

### Part 3: Configure your Apple Silicon Mac

1.  Open the **Terminal** app.
2.  Run the following command to create the required directory. Enter your password when prompted.
    ```bash
    sudo mkdir -p /usr/local/bin
    ```
3.  Run this command to link the dcli executable to the location Raycast expects.
    ```bash
    sudo ln -s /opt/homebrew/bin/dcli /usr/local/bin/dcli
    ```


