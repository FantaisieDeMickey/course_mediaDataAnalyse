* Encoding: UTF-8.

DATASET ACTIVATE 数据集1.
REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT go_detail_count
  /METHOD=ENTER title_length.

DATASET ACTIVATE 数据集1.
COMPUTE TL2=title_length * title_length.
EXECUTE.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT go_detail_count
  /METHOD=ENTER TL2 title_length.


REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT repin_count
  /METHOD=ENTER go_detail_count title_length.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT repin_count
  /METHOD=ENTER TL2 title_length.

compute news=0.
IF (category ="news_world") news=1.
IF (category ="news_society") news=1.
IF (category ="news_military") news=1.
IF (category ="news_hot") news=1.
IF (category ="news_finance") news=1.
IF (category ="__all__") news=1.
EXECUTE.

compute edu=0.
IF (category ="news_tech") edu=1.
IF (category ="news_regimen") edu=1.
IF (category ="news_history") edu=1.
IF (category ="news_essay") edu=1.
IF (category ="news_discovery") edu=1.
IF (category ="news_baby") edu=1.
EXECUTE.


compute entertain=0.
IF (category ="news_game") entertain=1.
IF (category ="news_food") entertain=1.
IF (category ="news_fashion") entertain=1.
IF (category ="news_entertainment") entertain=1.
IF (category ="news_car") entertain=1.
IF (category ="news_sports") entertain=1.
IF (category ="news_story") entertain=1.
IF (category ="news_travel") entertain=1.
EXECUTE.




REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT go_detail_count
  /METHOD=ENTER news edu.
