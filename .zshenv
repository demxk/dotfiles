getprivateip() {
	ip addr show wlp2s0 | head -3 | tail -1 | cut -d' ' -f6
}

fzf-history-widget-accept() {
  fzf-history-widget
  zle accept-line
}
