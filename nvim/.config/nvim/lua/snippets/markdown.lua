local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node

local function is_agents_file()
  return vim.fn.expand('%:t') == 'AGENTS.md'
end

return {
  s(
    {
      trig = 'agentslang',
      desc = 'AGENTS.md document language rules',
      condition = is_agents_file,
      show_condition = is_agents_file,
    },
    t({
      '## Agent 工作语言',
      '',
      '以下规则只约束 Agent 的沟通和开发过程文档，不改变项目现有的产品语言、界面文案、本地化规则或代码命名规范。',
      '',
      '- Agent 的解释、进度说明和交付报告默认使用简体中文。',
      '- Spec、tickets、ADR 和研究记录默认使用简体中文。',
      '- 产品界面文案、错误提示、公开文档和本地化资源遵循项目现有的语言规范。',
      '- 现有代码标识符、类型名、函数名、API 名称、文件路径、命令和第三方产品名保留原文。',
      '- 新增代码标识符遵循项目现有的命名规范和领域模型，不把英文标识符直接翻译成中文。',
      '- 项目领域术语优先遵循 `GLOSSARY.md`。',
      '- 中文开发文档首次出现重要英文术语时，采用“中文（English）”形式，后续使用中文。',
      '- GitHub/GitLab 标签、状态值、自动化依赖字段及其他机器读取的固定值保持原文。',
      '- 本地 ticket 文件名使用 ASCII kebab-case，正文使用简体中文。',
    })
  ),
}
