{ config, pkgs, ... }:
{
  programs.wofi = {
    enable = true;
    settings = {
	allow_markup = true;
	allow_image = true;
	hide_scroll=true;
	insensitive=true;
	lines=10;
	matching="contains";
	mode="drun";
	prompt="";
	width = "25%";
    };
    style = ''
	window {
  background-color: #191724;
  border-radius: 15px;
  font-family: "Operator Mono SSm Book";
  font-size: 12pt;
  margin: 0px;
}

#input {
  background-color: #1f1d2e;
  border-radius: 5px;
  color: #e0def4;
  font-size: 12pt;
  margin: 5px 5px 10px 5px;
  padding: 0 10px;
  border: 1px solid #414868;
}

#input:focus {
  border-color: #403d52;
}

#inner-box {
  margin: 5px;
}

#outer-box {
  margin: 10px;
}

#scroll {
}

#text {
  margin: 0px;
}

#entry {
  border-radius: 5px;
  color: #e0def4;
  padding: 5px 10px;
  margin: 0;
}

#entry:selected {
  color: #191724;
  background-color: #9ccfd8;
  border-color: none;
}

#text {
  padding-left: 8px;
}
#text:selected {
  color: #191724;
}
   '';
 };
 }
