# Auto Organizer Changelog
## v2.0.4 - Bug Fixes and GUI Improvements

### Bug Fixes
- Fixed error in the Logs tab

### GUI Improvements
- Logs tab got even prettier
- Some UI bugs has been fixed and resolved

## v2.0.3 - Functionality Fixes and Improvements

### Bug Fixes
- Fix when running the application while the application is already running gives you warning message

## v2.0.2 - Functionality Fixes and Improvements

### Bug Fixes
- Fixed issue where the application doesn't work on first start
- Fixed folder processing with commas and parentheses
- Fixed timer not starting when watching is enabled
- Added more detailed logging for file operations
- Improved directory processing to handle all tag formats
- Fixed inconsistent behavior when starting/stopping watching
- Fixed application not closing properly when using the close button
- Fixed multiple instances running simultaneously
- Fixed UI scaling issues on high-DPI displays
- Fixed settings not saving correctly in some scenarios
- Fixed crash when processing certain file types
- Fixed memory leaks during long-running operations

### New Features
- Added Windows Defender exclusion option in installer
- Added auto-save functionality for all settings
- Improved GUI with subtle hover effects on UI elements
- Added visible arrows in dropdown selectors
- Added clear button outlines for better visibility
- Enhanced error messages with more user-friendly descriptions
- Added confirmation dialogs for critical operations
- Added system tray notifications for background operations

### Technical Improvements
- Added immediate scan when watching is started
- Fixed signal handler warnings
- Improved error reporting for file operations
- Enhanced directory structure creation
- Improved installer with better version management
- Added proper application mutex to prevent multiple instances
- Enhanced cross-version compatibility (Windows 10/11)
- Improved application startup and shutdown sequence
- Added better thread management for background operations
- Enhanced logging system with more detailed information
- Improved error handling throughout the application
- Added better resource management for long-running operations