# GMDXv10 Community Edition Installer

This repository contains an installer for the Deus Ex mod **GMDXv10**. This is intended as a tool to help the mod development team. Only source code to build the installer is hosted here, not the mod itself. To install GMDX, please download the packaged files [here](https://www.moddb.com/mods/gmdx-v10-community-update). 

The rest of this document will explain how to build the installer.

## Prerequisites

The GMDX installer is built from a compilation script designed to be run by [Inno Setup](https://jrsoftware.org/isinfo.php), and the Inno Setup executable must be downloaded and installed.

You will also need to create three archives containing the mod data, which must be extractable as [7zip](https://www.7-zip.org/) archives. These archives should contain:
1. The "core" GMDX files (anything not contained in the other two archives).
2. All files necessary for installing the HDTP project.
3. All files necessary for installing the New Vision project.

## Building the Installer
Once the prerequisites are complete, building the installer is simple.
1. Place the three data archives directly in the `src/` directory.
2. Open the `install_script.iss` installer script. This is a simple text file and can be opened with any text editor.
3. Check under the `[Files]` section of the script, and ensure the data archive names match **EXACTLY**. If they do not match, you may modify the script, or rename the archives accordingly.
4. Run the main Inno Setup executable from wherever you installed it. This can be done from a terminal, when located in the project directory, with the command: `<PATH_TO_INNO_SETUP>\ISCC.exe install_script.iss`.
5. The completed compiled installer will appear in the `out/` directory!