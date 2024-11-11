Please download the latest file from the ‘Releases’ section of Winfix.
### Windows Optimization and Troubleshooting Script

This comprehensive batch script, created by Syr0nix, is designed to improve Windows performance, particularly for gaming, and assist with troubleshooting common system issues. It requires administrative privileges to execute fully and includes options for optimizing network, storage, and system settings. The script provides a menu of selective procedures or a "Run All" option for optimal performance. Each option executes system commands, modifies registry entries, manages services, or initiates tasks, enhancing system responsiveness and gaming experience.

Key Features and Procedures:

1. **CHKDSK and Drive Optimization** - Runs CHKDSK with repair options and defragments the primary drive to improve storage performance.
2. **Clean Temporary Folders** - Deletes files from the TEMP directory, freeing up space and reducing clutter.
3. **Windows Component Cleanup** - Uses DISM to clean up and optimize Windows components.
4. **Windows Image Integrity Check** - Repairs Windows system image with DISM to resolve potential system file corruption.
5. **System File Check (SFC)** - Runs `sfc /scannow` to verify and restore critical Windows system files.
6. **Network Settings Optimization** - Adjusts TCP/IP auto-tuning settings for better network performance.
7. **Adjust Internet Bandwidth** - Opens Group Policy Editor to configure bandwidth limits for system tasks, improving network efficiency.
8. **Set Power Plan to High Performance** - Sets the Windows power plan to high performance, ideal for gaming and resource-intensive tasks.
9. **Clear Event Logs** - Empties Windows Event Logs to free up system resources.
10. **Adjust for Best Performance** - Opens performance settings to adjust visual effects for maximum performance.
11. **Clear ARP Cache** - Clears Address Resolution Protocol (ARP) cache to potentially resolve network issues.
12. **Release/Renew IP Address and Flush DNS** - Refreshes network IP and DNS cache to fix connectivity issues.
13. **Upgrade All Packages** - Uses Windows Package Manager (`winget`) to update installed applications.
14. **Clean Prefetch Files** - Clears Windows Prefetch folder to improve startup times and reduce disk usage.
15. **Disable Unnecessary Startup Programs** - Opens the Startup Apps settings, allowing the user to disable apps from launching at startup.
16. **Disable Windows Visual Effects** - Tweaks registry settings to disable Windows visual effects, enhancing performance.
17. **Enable Windows Visual Effects (Default)** - Restores Windows visual effects for users preferring the default look and feel.
18. **Disable Xbox Game Bar** - Modifies registry entries, stops Game Bar processes, disables related scheduled tasks, and uninstalls the Xbox Game Bar to reduce resource usage and improve gaming performance.
19. **Enable Xbox Game Bar** - Re-enables Xbox Game Bar by modifying registry settings, reactivating tasks, and opening the Microsoft Store to manually reinstall the Game Bar.

"Run All Procedures" Option:
For maximum performance, especially for gaming, the "Run All Procedures" option executes a predefined set of procedures, including disabling Windows Visual Effects and Xbox Game Bar, to minimize system overhead and maximize resource availability.

This script provides users with flexible options for system maintenance, from selective optimizations to comprehensive system tuning, making it an invaluable tool for gamers and power users seeking to enhance their Windows experience.

