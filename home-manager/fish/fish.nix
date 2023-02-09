{pkgs, ...}:
{
	programs = {
		fish = {
			enable = true;
			shellInit = ''
				direnv hook fish | source		
				jump shell fish | source
				fish_vi_key_bindings
			'';
			shellAliases = {
				vi = "nvim";
			};
		};
	};
}


