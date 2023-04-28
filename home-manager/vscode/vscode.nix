{pkgs, ...}:
{
	programs = {
        vscode = {
			enable = true;
			extensions = with pkgs.vscode-extensions; [
				vscodevim.vim
				ms-dotnettools.csharp
				bbenoist.nix
				bierner.markdown-mermaid
			];
			userSettings = {
				"editor.fontFamily" = "'Inconsolata'";			
			};
		};
    };
}

