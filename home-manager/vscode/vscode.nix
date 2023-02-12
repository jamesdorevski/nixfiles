{pkgs, ...}:
{
	programs = {
        vscode = {
			enable = true;
			extensions = with pkgs.vscode-extensions; [
				vscodevim.vim
				ms-dotnettools.csharp
				bbenoist.nix
				mattn.lisp
			];
			userSettings = {
				"editor.fontFamily" = "'Fira Code'";			
			};
		};
    };
}

