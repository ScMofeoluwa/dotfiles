return {
  "f-person/git-blame.nvim",
  config = function()
    -- specificy config preferences
    require("gitblame").setup({
      message_template = "     <author>, <date> • <summary>",
      date_format = "%r",
      message_when_not_committed = "     <author>, <date> • Uncommitted changes",
    })
  end,
}
