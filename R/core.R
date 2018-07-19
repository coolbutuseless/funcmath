

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Plotmath operations as function calls
# Grouping is similar to that in the 'demo(plotmath)' output
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Arithmetic Operators
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
plus          <- '%+%'   <- function(x, y)   bquote( {.(x)} +    {.(y)})
minus         <- '%-%'   <- function(x, y)   bquote( {.(x)} -    {.(y)})
juxtapose     <- '%*%'   <- function(x, y)   bquote( {.(x)} *    {.(y)})
forwardslash  <- '%/%'   <- function(x, y)   bquote( {.(x)} /    {.(y)})
plusminus     <- '%+-%'  <- function(x, y)   bquote( {.(x)} %+-% {.(y)})
divide        <- '%//%'  <- function(x, y)   bquote( {.(x)} %/%  {.(y)})
times         <- '%x%'   <- function(x, y)   bquote( {.(x)} %*%  {.(y)})
cdot          <- '%.%'   <- function(x, y)   bquote( {.(x)} %.%  {.(y)})
neg                      <- function(x)      bquote(-{.(x)})
pos                      <- function(x)      bquote(+{.(x)})


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Sub/Superscripts
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
subscript     <- '%subscript%'    <-  '%_%'  <- function(x, y)  bquote({.(x)} [{.(y)}])
superscript   <- '%superscript%'  <-  '%^%'  <- function(x, y)  bquote({.(x)} ^ {.(y)})


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Radicals
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sqrt_   <- function(x, y=NULL)  bquote(sqrt({.(x)}, {.(y)}))


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Relations
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
eq             <-  '%eq%'    <-  '%=%'  <- function(x, y)  bquote({.(x)} ==     {.(y)})
neq            <-  '%neq%'   <-  '%!=%' <- function(x, y)  bquote({.(x)} !=     {.(y)})
lt             <-  '%<<%'               <- function(x, y)  bquote({.(x)} <      {.(y)})
le             <-  '%<=%'               <- function(x, y)  bquote({.(x)} <=     {.(y)})
gt             <-  '%>>%'               <- function(x, y)  bquote({.(x)} >      {.(y)})
ge             <-  '%>=%'               <- function(x, y)  bquote({.(x)} >=     {.(y)})
approximate    <-  '%~~%'               <- function(x, y)  bquote({.(x)} %~~%   {.(y)})
congruent      <-  '%=~%'               <- function(x, y)  bquote({.(x)} %=~%   {.(y)})
defined        <-  '%==%'               <- function(x, y)  bquote({.(x)} %==%   {.(y)})
proportional   <-  '%prop%'             <- function(x, y)  bquote({.(x)} %prop% {.(y)})
distributed    <-  '%~%'                <- function(x, y)  bquote({.(x)} %~%    {.(y)})

not            <- function(x)    { bquote(!{.(x)}) }


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Typeface
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
plain               <- function(x)  bquote(plain     ({.(x)}))
bold                <- function(x)  bquote(bold      ({.(x)}))
italic              <- function(x)  bquote(italic    ({.(x)}))
bolditalic          <- function(x)  bquote(bolditalic({.(x)}))
underline           <- function(x)  bquote(bolditalic({.(x)}))
symbol              <- function(x)  bquote(symbol    ({.(x)}))


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Set Relations
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
subset      <-    '%subset%'         <- function(x, y)  bquote({.(x)} %subset%    {.(y)})
subseteq    <-    '%subseteq%'       <- function(x, y)  bquote({.(x)} %subseteq%  {.(y)})
notsubset   <-    '%notsubset%'      <- function(x, y)  bquote({.(x)} %notsubset% {.(y)})
supset      <-    '%supset%'         <- function(x, y)  bquote({.(x)} %supset%    {.(y)})
supseteq    <-    '%supseteq%'       <- function(x, y)  bquote({.(x)} %supseteq%  {.(y)})
in_         <-    '%in_%'            <- function(x, y)  bquote({.(x)} %in%        {.(y)})
notin       <-    '%notin%'          <- function(x, y)  bquote({.(x)} %notin%     {.(y)})


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Accents
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
hat        <- function(x)  bquote(hat      ({.(x)}))
tilde      <- function(x)  bquote(tilde    ({.(x)}))
ring       <- function(x)  bquote(ring     ({.(x)}))
bar        <- function(x)  bquote(bar      ({.(x)}))
widehat    <- function(x)  bquote(widehat  ({.(x)}))
widetilde  <- function(x)  bquote(widetilde({.(x)}))


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Arrows
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
double_arrow         <-   '%<->%'      <- function(x, y)  bquote({.(x)} %<->%     {.(y)})
right_arrow          <-   '%->%'       <- function(x, y)  bquote({.(x)} %->%      {.(y)})
left_arrow           <-   '%<-%'       <- function(x, y)  bquote({.(x)} %<-%      {.(y)})
up_arrow             <-   '%up%'       <- function(x, y)  bquote({.(x)} %up%      {.(y)})
down_arrow           <-   '%down%'     <- function(x, y)  bquote({.(x)} %down%    {.(y)})
dbldbl               <-   '%<=>%'      <- function(x, y)  bquote({.(x)} %<=>%     {.(y)})
dblright             <-   '%=>>%'      <- function(x, y)  bquote({.(x)} %=>%      {.(y)})
dblleft              <-   '%<<=%'      <- function(x, y)  bquote({.(x)} %<=%      {.(y)})
dblup                <-   '%dblup%'    <- function(x, y)  bquote({.(x)} %dblup%   {.(y)})
dbldown              <-   '%dbldown%'  <- function(x, y)  bquote({.(x)} %dbldown% {.(y)})


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Symbolic Names - greek letters and other symbols are in the
# list of glyphs in "funcmath::g" e.g `funcmath::g$alpha`
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Style
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
displaystyle        <- function(x)  bquote(displaystyle     ({.(x)}))
textstyle           <- function(x)  bquote(textstyle        ({.(x)}))
scriptstyle         <- function(x)  bquote(scriptstyle      ({.(x)}))
scriptscriptstyle   <- function(x)  bquote(scriptscriptstyle({.(x)}))


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Spacing
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
phantom  <- function(x=NULL)  bquote(phantom({.(x)}))


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Fractions
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
frac    <-  '%frac%'      <- function(x, y)  bquote(frac({.(x)}, {.(y)}))
over    <-  '%over%'      <- function(x, y)  bquote(over({.(x)}, {.(y)}))
atop    <-  '%atop%'      <- function(x, y)  bquote(atop({.(x)}, {.(y)}))
space   <-  '%space%'     <- function(x, y)  bquote( {.(x)} ~    {.(y)})
space2  <-  '%space2%'    <- function(x, y)  bquote( {.(x)} ~{~     {.(y)}}  )
space3  <-  '%space3%'    <- function(x, y)  bquote( {.(x)} ~{~{~   {.(y)}}} )
space4  <-  '%space4%'    <- function(x, y)  bquote( {.(x)} ~{~{~{~ {.(y)}}}})

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Big Operators
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sum_        <- function(x, from=NULL, to=NULL)  bquote(sum      ({.(x)}, {.(from)}, {.(to)}))
prod_       <- function(x, from=NULL, to=NULL)  bquote(prod     ({.(x)}, {.(from)}, {.(to)}))
integral    <- function(x, from=NULL, to=NULL)  bquote(integral ({.(x)}, {.(from)}, {.(to)}))
union_      <- function(x, from=NULL, to=NULL)  bquote(union    ({.(x)}, {.(from)}, {.(to)}))
intersect_  <- function(x, from=NULL, to=NULL)  bquote(intersect({.(x)}, {.(from)}, {.(to)}))
lim         <- function(x, from=NULL, to=NULL)  bquote(lim      ({.(x)}, {.(from)}, {.(to)}))
min_        <- function(x, from=NULL, to=NULL)  bquote(min      ({.(x)}, {.(from)}, {.(to)}))
max_        <- function(x, from=NULL, to=NULL)  bquote(max      ({.(x)}, {.(from)}, {.(to)}))

inf         <- function(x)  bquote(inf({.(x)}))
sup         <- function(x)  bquote(sup({.(x)}))


ceiling_    <- function(x)  bquote(group(lceil , {.(x)}, rceil ))
floor_      <- function(x)  bquote(group(lfloor, {.(x)}, rfloor))


list_       <- function(...)  combine_expressions(..., sep=",")
paste_      <- function(...)  combine_expressions(..., sep="" )


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Big brackets which scale to fit
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
B <- bgroup <- function(x, l='(', r=NULL) {
  if (is.null(r)) {
    r <- c('('=')', '['=']', '{'='}', '|'='|', '||'='||')[[l]]
  }
  bquote(bgroup(.(l) , {.(x)}, .(r)))
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Small brackets which don't necessarily scale properly
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
G <- group <- function(x, l='(', r=NULL) {
  if (is.null(r)) {
    r <- c('('=')', '['=']', '{'='}', '|'='|', '||'='||')[[l]]
  }
  bquote(group(.(l) , {.(x)}, .(r)))
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Simple brackets ()
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
b <- function(x) {bquote(({.(x)}))}


