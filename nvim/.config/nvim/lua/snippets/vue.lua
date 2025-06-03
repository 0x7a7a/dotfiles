local ls = require('luasnip')
local i = ls.insert_node
local s = ls.snippet
local fmt = require('luasnip.extras.fmt').fmt

ls.filetype_extend('vue', { 'javascript', 'typescript' })

return {
  s(
    'vue3',
    fmt(
      [[
<script setup lang="ts">
{}
</script>

<template>
</template>

<style scoped>
</style>
]],
      {
        i(1, ''),
      }
    )
  ),
}
