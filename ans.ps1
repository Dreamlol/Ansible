#
# This Powershell script will download and install Cygwin and Ansible.
#
# Run from Powershell
#    Set-ExecutionPolicy bypass
#    & ansible-cygwin-installer.ps1
#
# Run from cmd with
#    powershell -ExecutionPolicy bypass ansible-cygwin-installer.ps1
#
#
# User variables. These may be changed to suit your environment.
#
$storageDir = $pwd
$cygwinHome = "ccygwin"
$cygwinUrlRoot = "http://cygwin.com/"
$getPipUrlRoot = "httpsbootstrap.pypa.io"
$cygwinMirror = "http://cygwin.mirrors.constant.com"



# Make temp directory
$path = "$pwd/temp_cy/"
if(!(test-path $path)){
New-Item -ItemType Directory -Path $path
}

echo $env:PROCESSOR_ARCHITECTURE
if ($env:PROCESSOR_ARCHITECTURE -eq 'AMD64') {
    $cygwinSetupExe = "setup-x86_64.exe"
    $url = "$cygwinUrlRoot$cygwinSetupExe"
	echo $url
	$file = "$path\$cygwinSetupExe"
	echo $file
	}
	
	
	
 elseif ($env:PROCESSOR_ARCHITECTURE -eq 'x86') {
    $cygwinSetupExe = "setup-x86.exe"
    $url = "$cygwinUrlRoot$cygwinSetupExe"
    $file ="$storageDir$cygwinSetupExe"
} else {
    echo 'Unknown processor architecture'
    exit
}

# Fully qualified path to Cygwin setup.exe
$cygwinSetupPath = "$path$cygwinSetupExe"

# Download Cygwin setup.exe, if it doesn't already exist
if ( ! ( Test-Path -Path $cygwinSetupPath -PathType Leaf ) ) {
	$webclient = New-Object System.Net.WebClient
    $webclient.DownloadFile($url, $file)

}
#http://cygwin.com/setup-x86_64.exe
#C:\setup-x86_64.exe
$cygwinSetupArgs = '--no-admin', '-q', '-R', $cygwinHome, '-s', $cygwinMirror, '--packages=wget, curl'
Start-Process -FilePath $cygwinSetupPath -ArgumentList $cygwinSetupArgs -Wait

# Add cygwin bin dir to path
#$ENVPATH=$cygwinHomebin;$ENVPATH

# Install pip
#Start-Process -FilePath $cygwinHomebinbash.exe -ArgumentList '-c', wget.exe $getPipUrlRootget-pip.py -Wait -NoNewWindow
#Start-Process -FilePath $cygwinHomebinbash.exe -ArgumentList '-c', 'python2.7.exe get-pip.py' -Wait -NoNewWindow

# Fix fork() errors on some systems
#Start-Process -FilePath $cygwinHomebindash.exe -ArgumentList '-c', 'usrbinrebaseall -v' -Wait -NoNewWindow

# Install Ansible via pip
#Start-Process -FilePath $cygwinHomebinbash.exe -ArgumentList '-c', 'pip2.7 install ansible' -Wait -NoNewWindow

# Run Ansible from outside of Cygwin shell
#Start-Process -FilePath $cygwinHomebinbash.exe -ArgumentList '-c', 'ansible --version' -Wait -NoNewWindow
