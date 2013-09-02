# TODO: publish as npm module or request change in underscore.string.words

# Lowercase word letters.
# Big thanks to Debilski: http://stackoverflow.com/a/2013539/1151982
re = ///
  [
  a-z
  æðǝəɛɣĳŋœĸſßþƿȝ
  ąɓçđɗęħįƙłøơşșţțŧųưy̨ƴ
  áàâäǎăāãåǻąæǽǣɓćċĉčçďḍđɗðéèėêëěĕēęẹǝəɛġĝǧğģɣ
  ĥḥħıíìiîïǐĭīĩįịĳĵķƙĸĺļłľŀŉńn̈ňñņŋóòôöǒŏōõőọøǿơœ
  ŕřŗſśŝšşșṣßťţṭŧþúùûüǔŭūũűůųụưẃẁŵẅƿýỳŷÿȳỹƴźżžẓ
  ]+
  ///g

module.exports    = (text) -> text.toLowerCase().match re
module.exports.re = re # TODO: getter without setter