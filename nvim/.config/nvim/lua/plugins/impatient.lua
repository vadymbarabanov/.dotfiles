local logger = require("utils.logger")

local ok, impatient = pcall(require, "impatient")
if not ok then
	logger.not_found("impatient")
	return
end

impatient.enable_profile()
