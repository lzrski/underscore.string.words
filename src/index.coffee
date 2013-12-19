# TODO: publish as npm module or request change in underscore.string.words

# Lowercase word letters.
# Big thanks to Debilski: http://stackoverflow.com/a/2013539/1151982
_re = ///
  [
  a-z
  æðǝəɛɣĳŋœĸſßþƿȝ
  ąɓçđɗęħįƙłøơşșţțŧųưy̨ƴ
  áàâäǎăāãåǻąæǽǣɓćċĉčçďḍđɗðéèėêëěĕēęẹǝəɛġĝǧğģɣ
  ĥḥħıíìiîïǐĭīĩįịĳĵķƙĸĺļłľŀŉńn̈ňñņŋóòôöǒŏōõőọøǿơœ
  ŕřŗſśŝšşșṣßťţṭŧþúùûüǔŭūũűůųụưẃẁŵẅƿýỳŷÿȳỹƴźżžẓ
  ]+
  ///g

module.exports    = (options, text) ->
  if not text? and typeof options is "string"
    text    = options
    options = {}

  re    = RegExp _re # Clone it so eventual changes won't mutate original
  lower = do text.toLowerCase

  if options.prefix?
    prefix = RegExp options.prefix
    re = RegExp prefix.source + re.source, "g"

  words = []
  while match = re.exec lower
    index   = match.index
    length  = match[0].length
    words.push text.slice index, index + length

  return words

module.exports.__defineGetter__ "re", -> _re