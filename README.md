### Windows Optimization and Troubleshooting Script

This comprehensive batch script, created by Syr0nix, is designed to enhance Windows performance, particularly for gaming, and assist with troubleshooting common system issues. It requires administrative privileges to execute fully and includes options for optimizing network, storage, and system settings. Users can select specific procedures or opt for a "Run All" mode for complete optimization. The script executes system commands, modifies registry entries, manages services, and initiates tasks to enhance system responsiveness and gaming experiences.

---

### Key Features and Procedures

1. **CHKDSK and Drive Optimization**  
   - Executes CHKDSK with repair options and defragments the primary drive to enhance storage performance.

2. **Clean Temporary Folders**  
   - Deletes files in the TEMP directory, freeing up disk space and reducing clutter.

3. **Windows Component Cleanup**  
   - Cleans and optimizes Windows components using DISM.

4. **Windows Image Integrity Check**  
   - Repairs system images via DISM to resolve potential file corruption.

5. **System File Check (SFC)**  
   - Runs `sfc /scannow` to verify and restore Windows system files.

6. **Network Settings Optimization**  
   - Adjusts TCP/IP auto-tuning settings to improve network performance.

7. **Set Power Plan to High Performance**  
   - Switches to the high-performance power plan, ideal for gaming or resource-intensive tasks.

8. **Clear Event Logs**  
   - Empties Windows Event Logs to reclaim system resources.

9. **Adjust for Best Performance**  
    - Opens visual effects settings to optimize for maximum performance.

10. **Clear ARP Cache**  
    - Removes the ARP cache to potentially fix network issues.

11. **Release/Renew IP Address and Flush DNS**  
    - Refreshes network IP and DNS cache to address connectivity problems.

12. **Upgrade All Packages**  
    - Uses `winget` to update installed applications.

13. **Clean Prefetch Files**  
    - Clears the Prefetch folder to improve startup times.

14. **Disable Unnecessary Startup Programs**  
    - Opens Startup Apps settings for disabling auto-launch apps.

15. **Disable Windows Visual Effects**  
    - Adjusts registry settings to disable visual effects for enhanced performance.

16. **Enable Windows Visual Effects (Default)**  
    - Restores default visual effects for a traditional Windows appearance.

17. **Disable Xbox Game Bar**  
    - Stops Game Bar processes, disables tasks, and uninstalls it to save resources.

18. **Enable Xbox Game Bar**  
    - Re-enables the Xbox Game Bar and its associated features.

---

### "Run All Procedures" Option  
For maximum performance, especially for gaming, the "Run All Procedures" mode implements a predefined set of optimizations, including disabling Windows visual effects and the Xbox Game Bar, ensuring minimal system overhead and maximum resource availability.

This script is a versatile tool, offering flexible options for system maintenance and comprehensive tuning. Whether you’re a gamer or a power user, it simplifies system optimization to improve your Windows experience.
