{pkgs, ...}:
{
	programs = {
		i3status-rust = {
			enable = true;
			bars = {
				bottom = {
					blocks = [
						{
							block = "docker";
							interval = 2;
							format = "{running}/{total}";
						}
						{
							block = "networkmanager";
							on_click = "alacritty -e nmtui";
							ap_format = "{ssid} ({strength})";
						}
						{
							block = "memory";
							display_type = "memory";
							format_mem = "{mem_used_percents}";
							format_swap = "{swap_used_percents}";
						}
						{
							block = "cpu";
							interval = 1;
						}
						{
							block = "battery";
							interval = 10;
							format = "{percentage} {time}";
						}
						{
							block = "sound";
						}
						{
							block = "time";
							format = "%a %d/%m %R";
							interval = 60;
						}
					];
				};
			};
		};
	};
}
