local litee = "ldelossa/litee.nvim"

return {
  {
    litee,
    main = "litee.lib",
    event = "VeryLazy",
    opts = {
      notify = { enabled = false },
      panel = {
          orientation = "bottom",
          panel_size = 10,
      },
    },
    config = true
  },
  {
    "ldelossa/litee-calltree.nvim",
    main = "litee.calltree",
    dependencies = {litee},
    event = "VeryLazy",
    opts = {
      on_open = "panel",
      map_resize_keys = false,
    },
    config = true
  }
}
