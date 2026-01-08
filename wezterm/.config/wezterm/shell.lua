local M = {}

function M.update_config(config)
	config.default_prog = {
		"/bin/zsh",
		"-l",
		"-c",
		"tmux attach -t mofeoluwa || tmux new -s mofeoluwa",
	}
end

return M
