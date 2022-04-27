local M = {}

local log_level = {
	TRACE = 0,
	DEBUG = 1,
	INFO = 2,
	WARN = 3,
	ERROR = 4,
}

local function notify(msg, level)
	local current_time = os.date("%H:%M %d.%m.%Y")

	vim.notify(current_time .. " " .. msg, level)
end

-- Common
M.error = function(msg)
	notify("[ERROR]: " .. msg, log_level.ERROR)
end

M.warn = function(msg)
	notify("[WARN]: " .. msg, log_level.WARN)
end

M.info = function(msg)
	notify("[INFO]: " .. msg, log_level.INFO)
end

-- Specific
M.not_found = function(package_name)
	M.warn(package_name .. " not found")
end

return M
