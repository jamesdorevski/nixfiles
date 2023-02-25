{pkgs, ...}:
{
	programs = {
        vscode = {
			enable = true;
			extensions = with pkgs.vscode-extensions; [
				vscodevim.vim
				ms-dotnettools.csharp
				bbenoist.nix
			];
			userSettings = {
				"editor.fontFamily" = "'Inconsolata'";			
			};
		};
    };
}

