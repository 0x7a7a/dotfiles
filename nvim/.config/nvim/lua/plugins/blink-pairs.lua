return {
  'saghen/blink.pairs',
  version = '*',
  enabled = false,
  -- download prebuilt binaries from github releases
  dependencies = 'saghen/blink.download',
  -- OR build from source, requires nightly:
  -- https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  opts = {
    highlights = {
      enabled = false,
    },
  },
}
