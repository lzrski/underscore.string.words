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

  re = RegExp _re # Clone it so eventual changes won't mutate original

  if options.prefix?
    prefix = RegExp options.prefix
    re = RegExp prefix.source + re.source, "g"

  text.toLowerCase().match re

module.exports.__defineGetter__ "re", -> _re