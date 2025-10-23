local ls = require('luasnip')
local s = ls.snippet
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt

return {
  s(
    { filetype = '', trig = 'service', desc = 'systemd service' },
    fmt(
      [[
        [Unit]
        Description={}
        After=network.target

        [Service]
        WorkingDirectory={}
        ExecStart={}
        Restart=always
        RestartSec=5
        StartLimitInterval=0

        [Install]
        WantedBy=multi-user.target
      ]],
      {
        i(1, 'My Service'),
        i(2, '/path/to/working/directory'),
        i(3, '/path/to/executable --arg1 --arg2'),
      }
    )
  ),
}
