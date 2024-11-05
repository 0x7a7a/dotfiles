local ls = require('luasnip')
local i = ls.insert_node
local s = ls.snippet
local fmt = require('luasnip.extras.fmt').fmt

return {
  s(
    'tpl',
    fmt(
      [[
  <script setup lang="ts">
  {}
  </script>

  <template></template>
  
  <style scoped></style>
  ]],
      { i(1) }
    )
  ),
  s(
    'style',
    fmt(
      [[
  <style scoped>
  {}
  </style>
  ]],
      { i(1) }
    )
  ),
}
