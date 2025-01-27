module AST

/*
 * Define Abstract Syntax for QL
 *
 * - complete the following data types
 * - make sure there is an almost one-to-one correspondence with the grammar
 */

/*
 * AST Syntax for form
 */
data AForm(loc src = |tmp:///|)
  = form(AId name, list[AQuestion] questions)
  ; 

/*
 * AST Syntax for questions
 * Divided in regular questions and if statements
 */
data AQuestion(loc src = |tmp:///|)
  = question(str name, APrompt prompt)
  | question(AExpr expr,  list[AQuestion] questions, list[AElseStatement] elseStatement)
  ; 


/*
 * AST Syntax for else statements
 */
data AElseStatement(loc src = |tmp:///|)
  = elseStat(list[AQuestion] questions)
  ;

/*
 * AST Syntax for prompts
 * The assignment to expression is optional
 */
data APrompt(loc src = |tmp:///|)
  = prompt(AId id, AType aType, list[AExpr] expressions)
  ;

/*
 * AST Syntax for expressions
 */
data AExpr(loc src = |tmp:///|)
  = expr(ATerm aterm)
  | exprPar(AExpr expr)
  | not(AExpr rhs)
  | umin(AExpr rhs)
  | binaryOp(ABinaryOp binOperator)
  ;

/*
 * AST Syntax for binary operators
 */
data ABinaryOp(loc src = |tmp:///|)
  = mul(AExpr lhs, AExpr rhs)
  | div(AExpr lhs, AExpr rhs)
  | add(AExpr lhs, AExpr rhs)
  | sub(AExpr lhs, AExpr rhs)
  | greth(AExpr lhs, AExpr rhs)
  | leth(AExpr lhs, AExpr rhs)
  | geq(AExpr lhs, AExpr rhs)
  | leq(AExpr lhs, AExpr rhs)
  | eqls(AExpr lhs, AExpr rhs)
  | neq(AExpr lhs, AExpr rhs)
  | and(AExpr lhs, AExpr rhs)
  | or(AExpr lhs, AExpr rhs)
  ;

/*
 * AST Syntax for types
 */
data AType(loc src = |tmp:///|)
  = atype(str typeName)
  ;

/*
 * AST Syntax for terms
 * Can be an id or a literal
 */
data ATerm(loc src = |tmp:///|)
  = term(AId x)
  | termInt(str integer)
  | termStr(str string)
  | termBool(str boolean)
  ;

/*
 * AST Syntax for id's
 */
data AId(loc src = |tmp:///|)
  = id(str name)
  ;

