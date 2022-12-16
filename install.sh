mkdir -p /workspace/.vscode-remote/extensions
rm -rf /workspace/.vscode-remote/extensions
# Pylance extension, Gitpod doesn't include Pylance
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=10JqxuSNMKxPdnVZvIx0pQd12u5OCuCwo' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=10JqxuSNMKxPdnVZvIx0pQd12u5OCuCwo" -O /workspace/.vscode-remote/extensions.zip && rm -rf /tmp/cookies.txt

if [[ $(diff -q <(echo "618bf1704a687f2b2cda612315a11ddda56d99c81462642e2f90a79c183d5c74  /workspace/.vscode-remote/extensions.zip") <(shasum -a 256 /workspace/.vscode-remote/extensions.zip)) ]]; then
	echo "extensions checksum failed"
else
	echo "extensions checksum passed"
	unzip /workspace/.vscode-remote/extensions.zip -d /workspace/.vscode-remote
	rm -rf /workspace/.vscode-remote/extensions.zip
fi;
