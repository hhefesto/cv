-- Read identity from the Markdown heading; presentation owns no CV facts.
function Pandoc(doc)
  for _, block in ipairs(doc.blocks) do
    if block.t == "Header" and block.level == 1 then
      local name = pandoc.utils.stringify(block.content)
      doc.meta.author = pandoc.MetaString(name)
      doc.meta.pagetitle = pandoc.MetaString(name .. " — CV")
      local escaped = name:gsub("\\", "\\\\"):gsub('"', '\\"')
      doc.meta["footer-name"] = pandoc.MetaInlines({
        pandoc.RawInline("html", '"' .. escaped .. '"')
      })
      break
    end
  end
  return doc
end
