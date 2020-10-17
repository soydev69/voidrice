{ config, pkgs, ... }:{
programs = {
	chromium = {
		enable = true;
		package = pkgs.brave;
	};
	lf = {
		enable = true;
		settings = {
			drawbox = true;
			color256 = true;
			dirfirst = true;
		};
	};
	git = {
		enable = true;
		package = pkgs.gitMinimal;
		userName = "andrew2jz";
		userEmail = "andrei.ataman@protonmail.com";
	};
	neovim = {
		enable = true;
		plugins = with pkgs.vimPlugins; [
			polyglot
			gruvbox
			airline
			vim-startify ];
		extraConfig = ''source /home/andrewSP/voidrice/.config/init.vim'';
	};
	fish = {
		enable = true;
		interactiveShellInit = "source ~/voidrice/.config/abbr.fish";
	};
};

home = {
	packages = with pkgs; [
		st
		sxiv
		dmenu
		gotop
		hsetroot
		neofetch
		unclutter
		yaru-theme
		breeze-gtk
		lxappearance ];
};
nixpkgs = {
	overlays = [(self: super: { dmenu = super.dmenu.override {
	patches = [
		/home/andrewSP/voidrice/.config/diffs/dmenu-cen.diff
		/home/andrewSP/voidrice/.config/diffs/dmenu-border.diff];};})];
	config.st.patches = [/home/andrewSP/voidrice/.config/diffs/st-x.diff];
};
xdg.configFile."spectrwm/spectrwm.conf".source =
	''/home/andrewSP/voidrice/.config/spectrwm/spectrwm.conf'';}
